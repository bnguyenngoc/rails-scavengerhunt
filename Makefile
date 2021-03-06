build:
	docker-compose -f docker-compose.yml build --no-cache
	docker-compose run web rails db:create
	docker-compose run web rails db:schema:load

run-dev:
	rm -f tmp/pids/server.pid > /dev/null 2>&1
	docker-compose -f docker-compose.yml up

bundle-install:
	docker-compose run web bundle install
	docker-compose -f docker-compose.yml build

run-dev-detached:
	docker-compose -f docker/docker-compose.yml up -d

make-migrations:
	docker-compose run web rails db:migrate

docker-kill-all:
	docker-compose -f docker/docker-compose.yml kill

docker-rm-all:
	docker-compose -f docker/docker-compose.yml rm -v -f

rspec:
	docker-compose run web rspec

clean:
	docker system prune -f
	docker-compose -f docker-compose.yml rm -sf
	docker-compose -f docker-compose.yml build


clean-db:
	 @echo 'Removing database data volume'
	 docker volume prune -f
	 docker-compose -f docker-compose.yml rm -sf
	 docker-compose -f docker-compose.yml build --no-cache
	 docker-compose run web rails db:create
	 docker-compose run web rails db:schema:load
	 
