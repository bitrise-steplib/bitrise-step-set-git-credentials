# Set Git Credentials

[![Step changelog](https://shields.io/github/v/release/bitrise-steplib/bitrise-step-set-git-credentials?include_prereleases&label=changelog&color=blueviolet)](https://github.com/bitrise-steplib/bitrise-step-set-git-credentials/releases)

Sets the Git user name and email address used by subsequent Steps in the Workflow.

<details>
<summary>Description</summary>

Sets the global Git identity (`user.name` and `user.email`) on the build machine, so every subsequent Step that creates Git commits or tags uses it as the author.

### Configuring the Step

1. Set the **Git Username** input to the name to use as the Git commit author.
2. Set the **Git Email Address** input to the email address to use as the Git commit author.

Both values are written to the global Git config (`git config --global`), so they apply to every repository on the build machine for the rest of the build.

### Troubleshooting

If commits created by later Steps still show a different author, check whether the repository's local Git config or the Step creating the commit overrides `user.name` or `user.email`. Local Git config takes precedence over the global one set by this Step.

### Useful links

- [git-config documentation](https://git-scm.com/docs/git-config)

### Related Steps

- [Git Clone Repository](https://www.bitrise.io/integrations/steps/git-clone)
- [Script](https://www.bitrise.io/integrations/steps/script)
</details>

## 🧩 Get started

Add this step directly to your workflow in the [Bitrise Workflow Editor](https://docs.bitrise.io/en/bitrise-ci/workflows-and-pipelines/steps/adding-steps-to-a-workflow.html).

You can also run this step directly with [Bitrise CLI](https://github.com/bitrise-io/bitrise).

### Examples

Set the identity, then create a commit in a later Step:

```yaml
steps:
- set-git-credentials@1:
    inputs:
    - git_user_name: Bitrise Buildbot
    - git_email_address: buildbot@example.com
- script:
    title: Commit the version bump
    inputs:
    - content: |-
        #!/usr/bin/env bash
        set -euo pipefail
        git add version.txt
        git commit -m "Bump version"
```

The same result can be achieved without this Step, by running the two `git config` commands in a [Script](https://www.bitrise.io/integrations/steps/script) Step:

```yaml
steps:
- script:
    title: Set Git Credentials
    inputs:
    - content: |-
        #!/usr/bin/env bash
        set -euo pipefail
        git config --global user.name "Bitrise Buildbot"
        git config --global user.email "buildbot@example.com"
```


## ⚙️ Configuration

<details>
<summary>Inputs</summary>

| Key | Description | Flags | Default |
| --- | --- | --- | --- |
| `git_user_name` | The name to set as the Git commit author. It is written to the global Git config as `user.name`. | required | `Bitrise Buildbot` |
| `git_email_address` | The email address to set as the Git commit author. It is written to the global Git config as `user.email`. | required |  |
</details>

<details>
<summary>Outputs</summary>
There are no outputs defined in this step
</details>

## 🙋 Contributing

We welcome [pull requests](https://github.com/bitrise-steplib/bitrise-step-set-git-credentials/pulls) and [issues](https://github.com/bitrise-steplib/bitrise-step-set-git-credentials/issues) against this repository.

For pull requests, work on your changes in a forked repository and use the Bitrise CLI to [run step tests locally](https://docs.bitrise.io/en/bitrise-ci/bitrise-cli/running-your-first-local-build-with-the-cli.html).

Learn more about developing steps:

- [Create your own step](https://docs.bitrise.io/en/bitrise-ci/workflows-and-pipelines/developing-your-own-bitrise-step/developing-a-new-step.html)
