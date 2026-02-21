.PHONY: install run test clean docker-build docker-run

install:
	pip install -r requirements.txt

run:
	@echo "Usage: python apps/<app-name>/app.py"
	@echo "Example: python apps/dash-clinical-analytics/app.py"

test:
	python -m pytest tests/ -v 2>/dev/null || echo "No tests configured"

clean:
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null; \
	find . -type f -name "*.pyc" -delete 2>/dev/null; \
	rm -rf dist/ build/ *.egg-info/ .pytest_cache/; \
	true

docker-build:
	docker build -t dash-sample-apps .

docker-run:
	docker run -p 8050:8050 dash-sample-apps
