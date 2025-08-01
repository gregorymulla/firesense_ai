.PHONY: help install dev test lint format type-check clean docs run

help:
	@echo "Available commands:"
	@echo "  install    Install production dependencies"
	@echo "  dev        Install development dependencies"
	@echo "  test       Run tests with coverage"
	@echo "  lint       Run code linting"
	@echo "  format     Format code with black"
	@echo "  type-check Run type checking with mypy"
	@echo "  clean      Clean build artifacts"
	@echo "  docs       Build documentation"
	@echo "  run        Run the application"

install:
	uv pip install -e .

dev:
	uv pip install -e ".[dev,docs]"
	pre-commit install

test:
	uv run pytest

test-verbose:
	uv run pytest -vv

test-coverage:
	uv run pytest --cov-report=html --cov-report=term

lint:
	uv run ruff check src tests

lint-fix:
	uv run ruff check --fix src tests

format:
	uv run black src tests

type-check:
	uv run mypy src

clean:
	rm -rf build dist *.egg-info
	rm -rf .coverage htmlcov .pytest_cache
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete

docs:
	uv run mkdocs build

docs-serve:
	uv run mkdocs serve

run:
	uv run gemma-3n run

run-debug:
	uv run gemma-3n --debug run

# Combined commands for CI
ci: lint type-check test

# Format and lint
fix: format lint-fix

# Full check
check: format lint type-check test

# Publishing commands
publish:
	@echo "Building package..."
	uv run python -m build
	@echo "Publishing to PyPI..."
	uv run python scripts/publish.py

publish-clean:
	rm -rf dist/ build/ *.egg-info/