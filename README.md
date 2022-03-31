# Obsolete

We don't need yet another plugin!

The following step definition works just as well and is one fewer thing for me to maintain :-)

```yaml
  - label: ":yaml: YAML Lint"
    plugins:
      - docker#v3.11.0:
          command: ["/workdir"]
          image: "cytopia/yamllint:latest"
```
