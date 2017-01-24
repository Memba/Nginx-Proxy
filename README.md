# Nginx-Proxy

> A dockerized Nginx reverse proxy for our AWS deployment

Note: We have stopped using it as of version v0.2.83 as AWS application load balancer now provides path-based routing to containers.

This was to be used with the following task definition

```json
{
  "containerDefinitions": [
    {
      "name": "memba-blog-1",
      "command": [],
      "cpu": 75,
      "entryPoint": [],
      "environment": [
        {
          "name": "NODE_ENV",
          "value": "production"
        },
        {
          "name": "TOKEN",
          "value": "###################################"
        }
      ],
      "essential": true,
      "image": "memba/memba-blog",
      "links": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "memba-blog",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "applogs"
        }
      },
      "memory": 192,
      "mountPoints": [],
      "portMappings": [],
      "volumesFrom": []
    },
    {
      "name": "kidoju-blog-1",
      "command": [],
      "cpu": 75,
      "entryPoint": [],
      "environment": [
        {
          "name": "NODE_ENV",
          "value": "production"
        },
        {
          "name": "TOKEN",
          "value": "###################################"
        }
      ],
      "essential": true,
      "image": "kidoju/kidoju-blog",
      "links": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "kidoju-blog",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "applogs"
        }
      },
      "memory": 192,
      "mountPoints": [],
      "portMappings": [],
      "volumesFrom": []
    },
    {
      "name": "kidoju-server-1",
      "command": [],
      "cpu": 150,
      "entryPoint": [],
      "environment": [
        {
          "name": "NODE_ENV",
          "value": "production"
        },
        {
          "name": "AWS_ACCESS_KEY_ID",
          "value": "###################"
        },
        {
          "name": "AWS_SECRET_ACCESS_KEY",
          "value": "#######################################"
        }
      ],
      "essential": true,
      "image": "jlchereau/kidoju-server",
      "links": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "kidoju-server",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "applogs"
        }
      },
      "memory": 320,
      "mountPoints": [],
      "portMappings": [],
      "volumesFrom": []
    },
    {
      "name": "kidoju-server-2",
      "command": [],
      "cpu": 150,
      "entryPoint": [],
      "environment": [
        {
          "name": "NODE_ENV",
          "value": "production"
        },
        {
          "name": "AWS_ACCESS_KEY_ID",
          "value": "###################"
        },
        {
          "name": "AWS_SECRET_ACCESS_KEY",
          "value": "#######################################"
        }
      ],
      "essential": true,
      "image": "jlchereau/kidoju-server",
      "links": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "kidoju-server",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "applogs"
        }
      },
      "memory": 320,
      "mountPoints": [],
      "portMappings": [],
      "volumesFrom": []
    },
    {
      "name": "kidoju-webapp-1",
      "command": [],
      "cpu": 150,
      "entryPoint": [],
      "environment": [
        {
          "name": "NODE_ENV",
          "value": "production"
        },
        {
          "name": "AWS_ACCESS_KEY_ID",
          "value": "###################"
        },
        {
          "name": "AWS_SECRET_ACCESS_KEY",
          "value": "#######################################"
        }
      ],
      "essential": true,
      "image": "jlchereau/kidoju-webapp",
      "links": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "kidoju-webapp",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "applogs"
        }
      },
      "memory": 320,
      "mountPoints": [],
      "portMappings": [],
      "volumesFrom": []
    },
    {
      "name": "kidoju-webapp-2",
      "command": [],
      "cpu": 150,
      "entryPoint": [],
      "environment": [
        {
          "name": "NODE_ENV",
          "value": "production"
        },
        {
          "name": "AWS_ACCESS_KEY_ID",
          "value": "###################"
        },
        {
          "name": "AWS_SECRET_ACCESS_KEY",
          "value": "#######################################"
        }
      ],
      "essential": true,
      "image": "jlchereau/kidoju-webapp",
      "links": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "kidoju-webapp",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "applogs"
        }
      },
      "memory": 320,
      "mountPoints": [],
      "portMappings": [],
      "volumesFrom": []
    },
    {
      "name": "nginx-proxy",
      "command": [],
      "cpu": 200,
      "entryPoint": [],
      "environment": [],
      "essential": true,
      "image": "jlchereau/nginx-proxy",
      "links": [
        "kidoju-server-1",
        "kidoju-server-2",
        "kidoju-webapp-1",
        "kidoju-webapp-2",
        "kidoju-blog-1",
        "memba-blog-1"
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "nginx-proxy",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "applogs"
        }
      },
      "memory": 256,
      "mountPoints": [],
      "portMappings": [
        {
          "hostPort": 80,
          "containerPort": 80
        }
      ],
      "volumesFrom": []
    }
  ]
}
```

