path = .docker-compose.yml


re :
	docker-compose down
	docker-compose up --build