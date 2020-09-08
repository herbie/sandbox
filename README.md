# Herbie Sandbox

This sandbox aims to provide a quick startup and a playground to test the Herbie package.

This is a minimal Django project with main dependencies: 
- The main [Herbie package](https://github.com/herbie/herbie)
- Two Herbie adapters: [Google Pubsub](https://github.com/herbie/google-pubsub-adapter) and [AWS SNS/SQS](https://github.com/herbie/aws-sns-sqs-adapter)

## Quick Start

### Requirements
- Docker
- Docker-compose

### Install

1 - Create a `.env` file and set the ports accordingly; the example file `.env.example` can be used.

2 - In the root project location, run:

```
    docker-compose run
```
**TIP**: use `docker-compose run -d` if you want to run the containers in the background.

This will install all the dependencies and run the needed containers.

### Setup

Jump into the `herbie` app container (`docker exec -it herbie bash`) and run:

1 - Import the available schema (`customer_v1`). Check [point 6.](https://github.com/herbie/herbie#step-by-step-guide) in the general Herbie documentation for more on this. 

2 - Init Google pubsub and AWS SNS/SQS publishers:

```
    python manage.py init_pubsub
```

```
    python manage.py init_sns_sqs
```
