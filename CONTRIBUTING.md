# Contributing

Thank you for your interest in contributing! All contributions are welcome.

## Development Process & Branching

We follow a GitFlow-style model:

1.  Create your feature branch from the `develop` branch (e.g., `feature/add-database-module`).
2.  Make your changes.
3.  **Before committing**, please run local quality checks:
    ```sh
    terraform fmt -recursive
    terraform validate
    ```
    *Pro-tip: Consider using a pre-commit hook like `pre-commit-terraform` to automate this.*
4.  Commit your changes and push them to your fork.
5.  Open a pull request from your feature branch back into the `develop` branch.

Our automated CI workflow will run a `terraform plan` to validate your changes against the development environment.
