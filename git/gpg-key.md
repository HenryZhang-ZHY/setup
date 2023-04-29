# GPG key

## Import GPG key

`gpg --import {path}`

## Trust the key

```shell
$ gpg --edit-key {key_id}
....

gpg> trust
```

choose 5 then type `quit` to exit.

## Setup Git config

```
git config --global user.signingkey {key_id}
git config --global commit.gpgsign true
```

## Trust GPG key of Github

```shell
$ curl https://github.com/web-flow.gpg | gpg --import
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   919  100   919    0     0   1702      0 --:--:-- --:--:-- --:--:--  1701
gpg: key 4AEE18F83AFDEB23: public key "GitHub (web-flow commit signing) <noreply@github.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1

$ gpg --sign-key 4AEE18F83AFDEB23

gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: next trustdb check due at 2028-02-02
pub  rsa2048/4AEE18F83AFDEB23
     created: 2017-08-16  expires: never       usage: SC
     trust: unknown       validity: unknown
[ unknown] (1). GitHub (web-flow commit signing) <noreply@github.com>


pub  rsa2048/4AEE18F83AFDEB23
     created: 2017-08-16  expires: never       usage: SC
     trust: unknown       validity: unknown
 Primary key fingerprint: 5DE3 E050 9C47 EA3C F04A  42D3 4AEE 18F8 3AFD EB23

     GitHub (web-flow commit signing) <noreply@github.com>

Are you sure that you want to sign this key with your
key "Zhang Hongyu (2023-2028) <imentu@foxmail.com>" (ABAEF1BB4FB730D0)

Really sign? (y/N) y
```

# References

- [Mogeko's Blog - GPG 的正确使用姿势](https://mogeko.me/posts/zh-cn/068/)
- [Zack Wu - 在 Github 上使用 GPG 的全过程](https://www.zackwu.com/posts/2019-08-04-how-to-use-gpg-on-github/)
