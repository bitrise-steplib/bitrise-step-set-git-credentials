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
