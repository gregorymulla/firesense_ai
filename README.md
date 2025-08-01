# FireSense

A modern Python project managed with [uv](https://github.com/astral-sh/uv) - the fast Python package manager.

## Features

- 🚀 **Fast Development**: Leverages uv for 10-100x faster dependency installation
- 📦 **Modern Packaging**: PEP 621 compliant with pyproject.toml
- 🔍 **Type Safety**: Full mypy strict mode support
- ✅ **Testing**: Comprehensive pytest setup with coverage
- 🎨 **Code Quality**: Pre-configured with ruff, black, and pre-commit
- 📚 **Documentation**: Ready for MkDocs with Material theme
- 🔄 **CI/CD**: GitHub Actions workflow included

## Quick Start

### Prerequisites

- Python 3.11 or higher
- [uv](https://github.com/astral-sh/uv) package manager

### Installation

1. Install uv:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

2. Clone the repository:
```bash
git clone https://github.com/yourusername/firesense.git
cd firesense
```

3. Create virtual environment and install dependencies:
```bash
uv venv
uv pip install -e ".[dev]"
```

4. Set up pre-commit hooks:
```bash
pre-commit install
```

## Usage

### Running the Application

```bash
# Run with default settings
uv run firesense run

# Run with custom host and port
uv run firesense run --host 127.0.0.1 --port 8080

# Run in debug mode
uv run firesense --debug run

# Show application info
uv run firesense info
```

### Development Commands

```bash
# Run tests
make test

# Run linting
make lint

# Format code
make format

# Type check
make type-check

# Run all checks
make check

# Build documentation
make docs

# Clean build artifacts
make clean
```

## Project Structure

```
firesense/
├── src/gemma_3n/       # Source code
│   └── fire_detection/ # Fire detection system
│       ├── models/     # Data models and AI interface
│       ├── processing/ # Video and frame processing
│       └── vision/     # Computer vision utilities
├── tests/              # Test suite
│   ├── unit/           # Unit tests
│   └── integration/    # Integration tests
├── docs/               # Documentation
├── scripts/            # Utility scripts
└── .github/            # GitHub Actions
```

## Configuration

The application can be configured using environment variables with the `GEMMA_` prefix:

```bash
export GEMMA_DEBUG=true
export GEMMA_API_PORT=9000
export GEMMA_LOG_LEVEL=DEBUG
```

Or using a `.env` file:

```env
GEMMA_DEBUG=true
GEMMA_API_PORT=9000
GEMMA_LOG_LEVEL=DEBUG
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests and checks (`make check`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.