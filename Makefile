path = .docker-compose.yml

all:
	docker-compose up --build

clean:
	docker-compose down

re :
	docker-compose down
	docker-compose up --build