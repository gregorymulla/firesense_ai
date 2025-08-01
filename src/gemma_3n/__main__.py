"""Main entry point for gemma-3n CLI."""

from gemma_3n.fire_detection.cli import app


def main() -> None:
    """Run the CLI application."""
    app()


if __name__ == "__main__":
    main()
