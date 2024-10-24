# Environment Variable Replacer
This is a small GitHub action which will loop through all environment variables and replace all instances of `__VARIABLE_NAME__` placeholders in one or more files with the environment variable's value.

For example if you have an env variable `MY_SECRET_KEY=01234567890` this action will replace all instances of the string `__MY_SECRET_KEY__` in the given files with the value `01234567890`.

## Inputs

Either the `filename` or `files` parameter is required.  If both are passed in, the `filename`  value will be ignored and only `files` will be used.

#### filename
- Path to a single file to run the replacement on.

#### files
- A list of newline delimited paths for one or more files to run the replacement on.

#### min-variable-length
- To help filter out system and other unnecessary environment variables (such as `_`) you can set a minimum length for env variable names to process.  This defaults to 2 and will filter out all single-character environment variables.

## Examples

```yaml
uses: ./.github/reusable/env_variable_replacer
with:
  filename: /src/package.json
```

```yaml
uses: ./.github/reusable/env_variable_replacer
with:
  files: |
    /package.json
    /.env
    /packages/package-1/package.json
    /packages/package-2/package.json
```

## Other Notes

The following environment variables are used by this action and will always be excluded from processing:
- `ACTION_INPUTS_FILENAME`
- `ACTION_INPUTS_FILENAMES`
- `ACTION_INPUTS_MIN_VARIABLE_LENGTH`
