PROBLEM?=0

build:
	docker build -t protohackers-base .

console:
	docker run -it -v $(PWD)/$(PROBLEM):/app -w /app protohackers-base bash

run:
	docker run --rm -it -p 2000:2000 -v $(PWD)/$(PROBLEM):/app -w /app protohackers-base ruby main.rb
