# TF Github Action

<!-- toc -->

* [Description](#description)
* [Inputs](#inputs)
* [Usage](#usage)
* [Permissions](#permissions)
* [Usage Examples](#usage-examples)
  * [Basic Usage](#basic-usage)
    * [Validate Only](#validate-only)
    * [Plan Only](#plan-only)
    * [Plan and Apply](#plan-and-apply)
  * [Variable Configuration Examples](#variable-configuration-examples)
    * [Using tfvar Files (Comma-separated)](#using-tfvar-files-comma-separated)
    * [Inline Variables (Newline-separated)](#inline-variables-newline-separated)
    * [Mixed Variable Sources](#mixed-variable-sources)
  * [Backend Configuration Examples](#backend-configuration-examples)
    * [Backend Configuration Files](#backend-configuration-files)
    * [Inline Backend Configuration](#inline-backend-configuration)
  * [Approval Gates](#approval-gates)
    * [Separate Plan and Apply Jobs](#separate-plan-and-apply-jobs)
  * [Comment and Summary Controls](#comment-and-summary-controls)
* [Contributing](#contributing)
  * [Guidelines](#guidelines)
  * [Contribution Workflow](#contribution-workflow)

<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- tocstop -->

<!-- action-docs-description source="action.yml" -->
## Description

This action will validate, plan and apply your OpenTofu configuration.
<!-- action-docs-description source="action.yml" -->

Workflow summaries are automatically updated from the different stages, this makes it easier to see validation issues, planned changed and apply results. Pull requests are decorated with a concise overview — giving you instant visibility at a glance.

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `version` | <p>The OpenTofu version to install (e.g., 1.10.x).</p> | `false` | `1.10.x` |
| `workdir` | <p>Path to the TF configuration directory (relative to repository root).</p> | `false` | `.` |
| `env` | <p>Deployment environment (eg <code>dev</code>, <code>staging</code> or <code>prod</code>). Accepts any string.</p> | `false` | `""` |
| `steps` | <p>Steps to run: <code>validate</code>, <code>plan</code>, <code>apply</code> (comma, space or newline separated). Use `all`` to run all steps.</p> | `false` | `all` |
| `tfvar-files` | <p>Comma, space or newline separated list of tfvar files to include</p> | `false` | `""` |
| `tfvars` | <p>Comma, space or newline separated key-value pairs for terraform variables (format: key1=value1)</p> | `false` | `""` |
| `backend-config-var-files` | <p>Comma, space or newline  separated list of backend config files to include</p> | `false` | `""` |
| `backend-config-vars` | <p>Comma, space or newline separated key-value pairs for backend configuration (format: key1=value1)</p> | `false` | `""` |
| `lock-timeout` | <p>State lock timeout for plan/apply (e.g., 5m)</p> | `false` | `""` |
| `parallelism` | <p>Parallelism for plan/apply</p> | `false` | `""` |
| `refresh` | <p>Refresh behavior for plan/apply (<code>true</code> or <code>false</code>)</p> | `false` | `""` |
| `targets` | <p>Comma, space or newline separated list of target resources for plan/apply</p> | `false` | `""` |
| `artifact-retention-days` | <p>Retention days for plan artifacts (1-90). Leave empty to use repository default</p> | `false` | `""` |
| `skip-plan-upload` | <p>Skip uploading the plan artifact</p> | `false` | `false` |
| `summary-mode` | <p>Plan/apply summary mode: <code>full</code>, <code>redacted</code>, or <code>off</code></p> | `false` | `full` |
| `comment-mode` | <p>PR comment mode: <code>sticky</code> to update a single comment or <code>off</code> to disable comments</p> | `false` | `sticky` |
| `comment-identifier` | <p>Identifier used to find/update sticky PR comments</p> | `false` | `tf-github-action` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->

<!-- action-docs-usage action="action.yml" project="coresolutionsltd/tf-github-action" version="main" -->
## Usage

```yaml
- uses: coresolutionsltd/tf-github-action@main
  with:
    version:
    # The OpenTofu version to install (e.g., 1.10.x).
    #
    # Required: false
    # Default: 1.10.x

    workdir:
    # Path to the TF configuration directory (relative to repository root).
    #
    # Required: false
    # Default: .

    env:
    # Deployment environment (eg `dev`, `staging` or `prod`). Accepts any string.
    #
    # Required: false
    # Default: ""

    steps:
    # Steps to run: `validate`, `plan`, `apply` (comma, space or newline separated). Use `all`` to run all steps.
    #
    # Required: false
    # Default: all

    tfvar-files:
    # Comma, space or newline separated list of tfvar files to include
    #
    # Required: false
    # Default: ""

    tfvars:
    # Comma, space or newline separated key-value pairs for terraform variables (format: key1=value1)
    #
    # Required: false
    # Default: ""

    backend-config-var-files:
    # Comma, space or newline  separated list of backend config files to include
    #
    # Required: false
    # Default: ""

    backend-config-vars:
    # Comma, space or newline separated key-value pairs for backend configuration (format: key1=value1)
    #
    # Required: false
    # Default: ""

    lock-timeout:
    # State lock timeout for plan/apply (e.g., 5m)
    #
    # Required: false
    # Default: ""

    parallelism:
    # Parallelism for plan/apply
    #
    # Required: false
    # Default: ""

    refresh:
    # Refresh behavior for plan/apply (`true` or `false`)
    #
    # Required: false
    # Default: ""

    targets:
    # Comma, space or newline separated list of target resources for plan/apply
    #
    # Required: false
    # Default: ""

    artifact-retention-days:
    # Retention days for plan artifacts (1-90). Leave empty to use repository default
    #
    # Required: false
    # Default: ""

    skip-plan-upload:
    # Skip uploading the plan artifact
    #
    # Required: false
    # Default: false

    summary-mode:
    # Plan/apply summary mode: `full`, `redacted`, or `off`
    #
    # Required: false
    # Default: full

    comment-mode:
    # PR comment mode: `sticky` to update a single comment or `off` to disable comments
    #
    # Required: false
    # Default: sticky

    comment-identifier:
    # Identifier used to find/update sticky PR comments
    #
    # Required: false
    # Default: tf-github-action
```
<!-- action-docs-usage action="action.yml" project="coresolutionsltd/tf-github-action" version="main" -->

## Permissions

The action can post PR comments and publish releases. Ensure your workflow grants the required permissions.

For PR comments:

```yaml
permissions:
  contents: read
  pull-requests: write
```

For semantic-release publishing:

```yaml
permissions:
  contents: write
  issues: write
  pull-requests: write
```

For supply-chain hardening, consider pinning third-party actions to commit SHAs.

## Usage Examples

This section provides examples of how to use the TF GitHub Action in various scenarios, from simple validation to multi-environment deployments with approval gates.

### Basic Usage

#### Validate Only
Perfect for pull requests to ensure OpenTofu configuration is valid without making any changes.

```yaml
name: Validate Only

on:
  pull_request:
    branches:
      - main

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Validate Configuration
        uses: coresolutionsltd/tf-github-action@main
        with:
          workdir: ./infra
          steps: validate
```

#### Plan Only
Generate and review execution plans without applying changes. Useful for code review and change approval processes.

```yaml
name: Plan Only

on:
  pull_request:
    branches:
      - main

jobs:
  plan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Plan Changes
        uses: coresolutionsltd/tf-github-action@main
        with:
          workdir: ./infra
          steps: plan
```

#### Plan and Apply
Complete workflow that validates, plans, and applies changes. Best for automated deployments to development environments.

```yaml
name: Deploy to Development

on:
  pull_request:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Deploy to Development Environment
        uses: coresolutionsltd/tf-github-action@main
        with:
          workdir: ./infra
          env: dev
          steps: all  # Runs validate, plan, and apply
```

### Variable Configuration Examples

#### Using tfvar Files (Comma-separated)
Load multiple variable files to configure your infrastructure with shared and environment-specific settings.

```yaml
- name: Deploy with Multiple Variable Files
  uses: coresolutionsltd/tf-github-action@main
  with:
    workdir: ./infra
    env: dev
    tfvar-files: common.tfvars, prod.tfvars
    steps: all
```
> `tfvar-files` can be comma, space or newline separated.

#### Inline Variables (Newline-separated)
Pass variables directly in the workflow for simple configurations or dynamic values.

```yaml
- name: Deploy with Inline Variables
  uses: coresolutionsltd/tf-github-action@main
  with:
    workdir: ./infra
    env: dev
    tfvars: |
      environment=development
      region=us-west-2
      instance_count=2
    steps: all
```

#### Mixed Variable Sources
Combine variable files and inline variables for maximum flexibility.

```yaml
- name: Deploy with Mixed Variable Sources
  uses: coresolutionsltd/tf-github-action@main
  with:
    workdir: ./infra
    env: dev
    tfvar-files: base.tfvars, dev.tfvars
    tfvars: |
      build_number=${{ github.run_number }}
      commit_sha=${{ github.sha }}
      deployed_by=${{ github.actor }}
      deployment_time=${{ github.event.head_commit.timestamp }}
    steps: all
```

### Backend Configuration Examples

#### Backend Configuration Files
Use configuration files to manage remote state across different environments.

```yaml
- name: Initialize with Backend Configuration Files
  uses: coresolutionsltd/tf-github-action@main
  with:
    workdir: ./infra
    env: staging
    backend-config-var-files: backend-base.conf, backend-staging.conf
    steps: plan
```

#### Inline Backend Configuration
Configure remote state directly in the workflow for dynamic setups.

```yaml
- name: Configure Remote State Inline
  uses: coresolutionsltd/tf-github-action@main
  with:
    workdir: ./infra
    backend-config-vars: |
      bucket=my-terraform-state-${{ github.repository_owner }}
      key=${{ github.repository }}/terraform.tfstate
      region=us-west-2
      encrypt=true
    steps: all
```

### Approval Gates

Public and Enterprise private GitHub repositories can apply deployment protection rules. These can require people or teams to approve a workflow before using a specific environment. Deployment protection rules are an excellent way to require approval before applying changes - we simply separate our plan and apply steps, with the apply step running in a protected environment.

#### Separate Plan and Apply Jobs
This pattern separates planning from applying, allowing for review and approval between steps.

```yaml
name: Infrastructure Deployment with Approval

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  plan:
    name: Plan Infrastructure Changes
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Plan Production Changes
        uses: coresolutionsltd/tf-github-action@main
        with:
          workdir: ./infra
          env: prod
          tfvar-files: base.tfvars, prod.tfvars
          tfvars: build_number=${{ github.run_number }}
          steps: validate plan

  apply:
    name: Apply Infrastructure Changes
    runs-on: ubuntu-latest
    needs: plan
    environment: prod  # This environment can have protection rules
    steps:
      - uses: actions/checkout@v4

      - name: Apply Production Changes
        uses: coresolutionsltd/tf-github-action@main
        with:
          workdir: ./infra
          env: prod  # env must match what is planned
          steps: apply  # Only apply, plan artifact is downloaded automatically
```

> [!NOTE]
> Apply-only runs require a plan artifact from a previous job or run. Leave `skip-plan-upload` as `false` when you intend to apply later.

### Comment and Summary Controls

Control PR comments and redact plan/apply output in summaries.

```yaml
- name: Plan with redacted summaries and no PR comment
  uses: coresolutionsltd/tf-github-action@main
  with:
    workdir: ./infra
    steps: plan
    summary-mode: redacted
    comment-mode: off
    artifact-retention-days: 7
```

Use `comment-identifier` if you want separate sticky comments per workflow or environment.

These examples are meant to give you the building blocks for putting together a complete infrastructure deployment workflow. You can mix and match them to create pipelines that validate, plan, and apply your configuration, while also adding steps for review and approval where it makes sense.

Use these patterns as starting points and adapt them to fit the way your team works.

If something doesn’t quite work for you, or there’s a use case we haven’t covered yet, please open an [issue](../../issues) and we’ll look into adding it.

## Contributing

We welcome contributions to improve our GitHub Action!

### Guidelines
- **Issues**
  - Before starting work, please [open an issue](../../issues) to discuss bugs, features, or improvements.

- **Fork & Branch**
  - Fork the repository and create a feature branch from `main`.
  - Use descriptive branch names (e.g., `feat/extend-plan-summary` or `fix/validation-error`).

- **Commits**
  - We use [Conventional Commits](https://www.conventionalcommits.org/) to ensure automated versioning with semantic release.
  - Examples:
    - `feat: add x capability to validate`
    - `fix: resolve y validation issue`
    - `docs: update z usage example`

- **Pre-commit Hooks**
  - Install and enable [pre-commit](https://pre-commit.com/) before committing.
  - Run `pre-commit install` once after cloning to enforce linting, formatting, and checks locally.

- **Pull Requests**
  - Ensure your PR references the related issue (e.g., `Closes #42`).
  - Include tests if adding functionality.
  - Update documentation where relevant.
  - Keep PRs focused and small where possible.

### Contribution Workflow
1. Open an issue to propose a change.
2. Fork the repo and create a feature branch.
3. Make changes, following commit and pre-commit guidelines.
4. Push your branch and open a Pull Request.
5. The maintainers will review, request changes if needed, and merge once approved.
