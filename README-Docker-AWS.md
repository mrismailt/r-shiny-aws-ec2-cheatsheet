https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html

aws ecr get-login-password --region region | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com

docker tag e9ae3c220b23 aws_account_id.dkr.ecr.region.amazonaws.com/my-web-app

docker push aws_account_id.dkr.ecr.region.amazonaws.com/my-web-app

https://docs.docker.com/cloud/ecs-integration/

docker context create ecs myecscontext

