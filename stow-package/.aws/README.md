# How to use this script

In order to use this script you call it with a `source` profile in the format
```
something-something-something
```

The script will use the `mfa_serial` of that `source` profile to call
```
aws sts get-session-token --profile <source-profile> --output text --serial-number <mfa_serial of source-profile> --token-code <code>
```

The resulting session information will be saved into the profile with the name `something-something`

## Example

```
$ cat ~/.aws/config | head -n 2
[profile company-mfa-source]
mfa_serial = arn:aws:iam::123123123123:mfa/animi.vulpis
```

```
$ cat ~/.aws/credentials | head -n 3
[company-mfa-source]
aws_access_key_id = ABCABCABCABC12ABCABC
aws_secret_access_key = 123abcABC123abcABC123abcABC123abcABC
```

```
$ ./update-session-token.sh company-mfa-source
Enter token for rn:aws:iam::123123123123:mfa/animi.vulpis: 123456
session expires: 2021-01-25T20:15:42+00:00

$ cat ~/.aws/credentials | tail -n 4
[company-mfa]
aws_access_key_id = DEFDEFDEFDEF34DEFDEF
aws_secret_access_key = 456defDEF456defDEF456defDEF456defDEF
aws_session_token = <pretty-long-token>
```

Ready to be used by your other configs like this:
```
$ cat ~/.aws/config | tail -n 7
[profile something]
cli_pager =
cli_auto_prompt = on-partial
source_profile = company-mfa
role_session_name = Session_Animi_Vulpis
role_arn = arn:aws:iam::789789789789:role/ImportantRole
region = secret-volcanic-island
```
