

run:
	docker run -d --network host --publish 5000:5000 --name test_server

stop:
	docker stop test_server

