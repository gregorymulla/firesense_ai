# Publishing FireSense to PyPI

This guide explains how to publish the FireSense package to PyPI.

## Prerequisites

1. Create a PyPI account at https://pypi.org/account/register/
2. Create an API token at https://pypi.org/manage/account/token/
3. Install twine: `pip install twine`

## Building the Package

The package has already been built, but if you need to rebuild:

```bash
# Clean previous builds
rm -rf dist/ build/ *.egg-info/

# Build the package
python -m build
```

## Testing with TestPyPI (Recommended)

First, test your package on TestPyPI:

1. Create a TestPyPI account at https://test.pypi.org/account/register/
2. Create an API token at https://test.pypi.org/manage/account/token/

Upload to TestPyPI:
```bash
python -m twine upload --repository testpypi dist/*
```

Test installation:
```bash
pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/ firesense
```

## Publishing to PyPI

Once you've tested on TestPyPI:

```bash
# Upload to PyPI
python -m twine upload dist/*
```

You'll be prompted for:
- Username: `__token__`
- Password: Your PyPI API token (including the `pypi-` prefix)

## After Publishing

Once published, users can install FireSense with:

```bash
pip install firesense
```

## Version Management

To release a new version:

1. Update the version in `pyproject.toml`
2. Commit the changes
3. Create a git tag: `git tag v0.1.0`
4. Push the tag: `git push origin v0.1.0`
5. Build and upload the new version

## Troubleshooting

- If the package name is taken, you'll need to choose a different name in `pyproject.toml`
- Make sure all dependencies are properly specified
- Test the package thoroughly before publishing
- Consider using GitHub Actions for automated releases