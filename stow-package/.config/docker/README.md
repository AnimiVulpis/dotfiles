# Docker configuration notes

Create a `config.json` in the config folder with

```json
    {
        "credHelpers": {
            "123412341234.dkr.ecr.some-region-1.amazonaws.com": "ecr-login"
        }
    }
```

For this you need [amazon ecr credential helper](https://github.com/awslabs/amazon-ecr-credential-helper) installed
