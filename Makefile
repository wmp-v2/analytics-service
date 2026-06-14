docker-build:
	git pull
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 471451201019.dkr.ecr.us-east-1.amazonaws.com
	docker build -t 471451201019.dkr.ecr.us-east-1.amazonaws.com/analytics-service:latest .
	docker push 471451201019.dkr.ecr.us-east-1.amazonaws.com/analytics-service:latest

eks-deploy:
	helm upgrade -i analytics-service . -f analytics-service.yml
