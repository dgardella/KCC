# Code Challenge Resolution.


### Step1 : Generate dockerfile 

 
 - 1.a : Generate docker image
 
 ```
 (py3venv) dmgardella@abacaxi:~/KCC (main %>)$ docker build . -t dmg8/litecoin:1.18
Sending build context to Docker daemon  1.952MB
Step 1/17 : FROM ubuntu:20.04
20.04: Pulling from library/ubuntu
Digest: sha256:9d6a8699fb5c9c39cf08a0871bd6219f0400981c570894cd8cbea30d3424a31f
Status: Downloaded newer image for ubuntu:20.04
 ---> fb52e22af1b0
Step 2/17 : RUN apt-get update     && apt install -y --no-install-recommends gpg gpg-agent wget curl    && rm -rf /var/lib/apt/lists/*
 ---> Using cache
 ---> 3ecfcd3f1d66
Step 3/17 : RUN groupadd -g 999 applitecoin &&     useradd -r -u 999 -g applitecoin applitecoin
 ---> Using cache
 ---> a6e0b54f50c5
Step 4/17 : RUN mkdir -p /app/litecoin
 ---> Using cache
 ---> 5b9bfd4294c9
Step 5/17 : RUN mkdir -p /home/applitecoin
 ---> Running in 2ea30c774e0d
Removing intermediate container 2ea30c774e0d
 ---> e984206fe853
Step 6/17 : RUN chown applitecoin /app/litecoin
 ---> Running in 34ffd7eafecc
Removing intermediate container 34ffd7eafecc
 ---> dd0c6a474aa7
Step 7/17 : RUN chown applitecoin /home/applitecoin
 ---> Running in 9fe454e9cfc0
Removing intermediate container 9fe454e9cfc0
 ---> 46312baaba2f
Step 8/17 : USER applitecoin
 ---> Running in b9f44afb3ab2
Removing intermediate container b9f44afb3ab2
 ---> d556cd8789aa
Step 9/17 : WORKDIR /app/litecoin
 ---> Running in f66a9c99304d
Removing intermediate container f66a9c99304d
 ---> 59198b62b333
Step 10/17 : RUN curl "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xFE3348877809386C" > FE3348877809386C.key
 ---> Running in 35882ae9ef52
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 12396    0 12396    0     0   8531      0 --:--:--  0:00:01 --:--:--  8525
Removing intermediate container 35882ae9ef52
 ---> af82be50f51d
Step 11/17 : RUN gpg --import FE3348877809386C.key
 ---> Running in d6152052b4cb
gpg: directory '/home/applitecoin/.gnupg' created
gpg: keybox '/home/applitecoin/.gnupg/pubring.kbx' created
gpg: key FE3348877809386C: 20 signatures not checked due to missing keys
gpg: /home/applitecoin/.gnupg/trustdb.gpg: trustdb created
gpg: key FE3348877809386C: public key "Adrian Gallagher <thrasher@addictionsoftware.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1
gpg: no ultimately trusted keys found
Removing intermediate container d6152052b4cb
 ---> 670d4fa18586
Step 12/17 : RUN gpg --fingerprint FE3348877809386C
 ---> Running in 041e46da9d69
pub   rsa2048 2013-06-19 [SC]
      59CA F0E9 6F23 F537 4794  5FD4 FE33 4887 7809 386C
uid           [ unknown] Adrian Gallagher <thrasher@addictionsoftware.com>
sub   rsa2048 2013-06-19 [E]

Removing intermediate container 041e46da9d69
 ---> ff71b9168567
Step 13/17 : RUN wget --no-check-certificate https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-x86_64-linux-gnu.tar.gz     && wget --no-check-certificate https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-linux-signatures.asc
 ---> Running in 4bd183b355fa
--2021-09-09 17:53:30--  https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-x86_64-linux-gnu.tar.gz
Resolving download.litecoin.org (download.litecoin.org)... 104.25.115.78, 104.25.116.78, 172.67.82.181
Connecting to download.litecoin.org (download.litecoin.org)|104.25.115.78|:443... connected.
WARNING: cannot verify download.litecoin.org's certificate, issued by 'CN=Cloudflare Inc ECC CA-3,O=Cloudflare\\, Inc.,C=US':
  Unable to locally verify the issuer's authority.
HTTP request sent, awaiting response... 200 OK
Length: 31895174 (30M) [application/octet-stream]
Saving to: 'litecoin-0.18.1-x86_64-linux-gnu.tar.gz'

     0K .......... .......... .......... .......... ..........  0% 4.84M 6s
(trimed)
 31100K .......... .......... .......... .......... .......   100%  687K=8.3s

2021-09-09 17:53:39 (3.66 MB/s) - 'litecoin-0.18.1-x86_64-linux-gnu.tar.gz' saved [31895174/31895174]

--2021-09-09 17:53:39--  https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-linux-signatures.asc
Resolving download.litecoin.org (download.litecoin.org)... 104.25.115.78, 104.25.116.78, 172.67.82.181
Connecting to download.litecoin.org (download.litecoin.org)|104.25.115.78|:443... connected.
WARNING: cannot verify download.litecoin.org's certificate, issued by 'CN=Cloudflare Inc ECC CA-3,O=Cloudflare\\, Inc.,C=US':
  Unable to locally verify the issuer's authority.
HTTP request sent, awaiting response... 200 OK
Length: 1073 (1.0K) [application/octet-stream]
Saving to: 'litecoin-0.18.1-linux-signatures.asc'

     0K .                                                     100% 7.21M=0s

2021-09-09 17:53:39 (7.21 MB/s) - 'litecoin-0.18.1-linux-signatures.asc' saved [1073/1073]

Removing intermediate container 4bd183b355fa
 ---> f996a82bb73a
Step 14/17 : RUN gpg --verify litecoin-0.18.1-linux-signatures.asc
 ---> Running in 6362d11d90f0
gpg: Signature made Wed Jun 10 04:57:17 2020 UTC
gpg:                using RSA key 59CAF0E96F23F53747945FD4FE3348877809386C
gpg: Good signature from "Adrian Gallagher <thrasher@addictionsoftware.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 59CA F0E9 6F23 F537 4794  5FD4 FE33 4887 7809 386C
Removing intermediate container 6362d11d90f0
 ---> 540363317cc8
Step 15/17 : RUN tar -zxvf litecoin-0.18.1-x86_64-linux-gnu.tar.gz
 ---> Running in 726267b8f7bf
litecoin-0.18.1/
(trimed)
litecoin-0.18.1/share/man/man1/litecoin-wallet.1
Removing intermediate container 726267b8f7bf
 ---> 3b19f588ae7c
Step 16/17 : CMD [ "litecoin-0.18.1/bin/litecoind" ]
 ---> Running in 7c8374743d31
Removing intermediate container 7c8374743d31
 ---> ec94c7358052
Step 17/17 : HEALTHCHECK CMD "ps -ef | grep litecoind" || exit 1
 ---> Running in 04be266ef155
Removing intermediate container 04be266ef155
 ---> 334761439bae
Successfully built 334761439bae
Successfully tagged dmg8/litecoin:1.18
(py3venv) dmgardella@abacaxi:~/KCC (main %>)$

```

 - 1.b : verifiy image with anchore

```
dmgardella@abacaxi:~/KCC (main=)$ curl -s https://ci-tools.anchore.io/inline_scan-latest | bash -s -- -p -r dmg8/litecoin:1.18
Pulling image -- dmg8/litecoin:1.18
1.18: Pulling from dmg8/litecoin
Digest: sha256:a5553e290514cfdc26c3ebbacdf3875ca588c7e372712a93e7c8ce2721aba2d4
Status: Image is up to date for dmg8/litecoin:1.18
docker.io/dmg8/litecoin:1.18

Pulling docker.io/anchore/inline-scan:v0.10.2
v0.10.2: Pulling from anchore/inline-scan
296e14ee2414: Pull complete
(trimed)
Copying blob sha256:6a9c0c4b26a08b4eb314198cb0b24fa784a783e5da171c0c38cb006f24424810
Copying config sha256:a52285dff85f5055de1a113d90fe0bca6c4ec7c1b2a1884d4f0f7e5944b2c7d7
Writing manifest to image destination
Storing signatures

Image archive loaded into Anchore Engine using tag -- litecoin:1.18
Waiting for analysis to complete...

        Status: not_analyzed
        Status: analyzing............
        Status: analyzed

Analysis completed!

Successfully generated anchore-reports/litecoin_1.18-content-os.json.
Successfully generated anchore-reports/litecoin_1.18-content-files.json.
Successfully generated anchore-reports/litecoin_1.18-vuln.json.
Successfully generated anchore-reports/litecoin_1.18-details.json.
Successfully generated anchore-reports/litecoin_1.18-policy.json.

        Policy Evaluation - litecoin:1.18
-----------------------------------------------------------

Image Digest: sha256:be2c108e261bc655e1c5d7ae3d0118b54c21a0d355ff5065703379ade77717e3
Full Tag: localhost:5000/litecoin:1.18
Image ID: a52285dff85f5055de1a113d90fe0bca6c4ec7c1b2a1884d4f0f7e5944b2c7d7
Status: pass
Last Eval: 2021-09-10T06:11:33Z
Policy ID: 2c53a13c-1765-11e8-82ef-23527761d060
Final Action: warn
Final Action Reason: policy_evaluation

Gate                   Trigger        Detail                                                                                                                                                         Status
vulnerabilities        package        MEDIUM Vulnerability found in os package type (dpkg) - libk5crypto3 (CVE-2021-36222 - http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-36222)            warn
vulnerabilities        package        MEDIUM Vulnerability found in os package type (dpkg) - libkrb5support0 (CVE-2021-36222 - http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-36222)         warn
vulnerabilities        package        MEDIUM Vulnerability found in os package type (dpkg) - libkrb5-3 (CVE-2021-36222 - http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-36222)               warn
vulnerabilities        package        MEDIUM Vulnerability found in os package type (dpkg) - wget (CVE-2021-31879 - http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-31879)                    warn
vulnerabilities        package        MEDIUM Vulnerability found in os package type (dpkg) - libgssapi-krb5-2 (CVE-2021-36222 - http://people.ubuntu.com/~ubuntu-security/cve/CVE-2021-36222)        warn
vulnerabilities        package        MEDIUM Vulnerability found in os package type (dpkg) - libsqlite3-0 (CVE-2020-9794 - http://people.ubuntu.com/~ubuntu-security/cve/CVE-2020-9794)              warn

Copying scan reports from 27852-inline-anchore-engine to /home/dmgardella/KCC/anchore-reports/

Cleaning up docker container: 27852-inline-anchore-engine

```

### Step 2 : Create ReplicaSet

```
dmgardella@abacaxi:~/KCC (main=)$ kubectl apply -f SF.yaml
statefulset.apps/litecoin-node created

dmgardella@abacaxi:~/KCC (main=)$ kubectl get statefulset
NAME            READY   AGE
litecoin-node   1/1     2m1s

dmgardella@abacaxi:~/KCC (main=)$ k logs litecoin-node-0 | tail
2021-09-09T20:45:55Z addcon thread start
2021-09-09T20:45:55Z dnsseed thread start
2021-09-09T20:45:55Z Loading addresses from DNS seeds (could take a while)
2021-09-09T20:45:55Z net thread start
2021-09-09T20:46:06Z 48 addresses found from DNS seeds
2021-09-09T20:46:06Z dnsseed thread exit
2021-09-09T20:46:06Z New outbound peer connected: version: 70015, blocks=2119958, peer=0
2021-09-09T20:46:10Z New outbound peer connected: version: 70015, blocks=2119958, peer=1
2021-09-09T20:46:13Z New outbound peer connected: version: 70015, blocks=2119958, peer=2
2021-09-09T20:46:17Z New outbound peer connected: version: 70015, blocks=2119958, peer=3

```

### Step 3 : Pipeline : JenkinsFile

### Step 4 : Bash script - Write shell script to find the top 10 word ocurrence of a given text.

```
dmgardella@abacaxi:~/KCC (main %>)$ cat test/data/moby_dick.txt | sed -e 's/[^[:alpha:]]/ /g' | tr '\n' " " |  tr -s " " |  tr " " '\n' |  tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head
  14620 the
   6732 of
   6502 and
   4799 a
   4706 to
   4231 in
   3100 that
   2536 it
   2530 his
   2127 i

```


### Step 5 : Code snippet to resolve #4 challenge

```
(py3venv) dmgardella@abacaxi:~/KCC (main *+=)$ python process.py --file test/data/moby_dick.txt
Processing File : test/data/moby_dick.txt

 ------------ printing Top 10 -----------

+----------------------+-------+
| word ocurrance count | Hits  |
+----------------------+-------+
|       ('the',)       | 14485 |
|       ('of',)        | 6701  |
|       ('and',)       | 6418  |
|        ('a',)        | 4679  |
|       ('to',)        | 4654  |
|       ('in',)        | 4196  |
|      ('that',)       | 2948  |
|       ('his',)       | 2518  |
|       ('it',)        | 2375  |
|        ('i',)        | 1933  |
+----------------------+-------+
--------------------------------------------------

```


### Step 6 : Terraform :

```
dmgardella@abacaxi:~/KCC (main=)$ cd TF
dmgardella@abacaxi:~/KCC/TF (main=)$ terraform apply --auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_group.group will be created
  + resource "aws_iam_group" "group" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "group_KCC_TF"
      + path      = "/"
      + unique_id = (known after apply)
    }

  # aws_iam_policy.policy will be created
  + resource "aws_iam_policy" "policy" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "policy_KCC_TF"
      + path      = "/"
      + policy    = (known after apply)
      + policy_id = (known after apply)
      + tags_all  = (known after apply)
    }

  # aws_iam_role.role will be created
  + resource "aws_iam_role" "role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + AWS = "arn:aws:iam::<hide>:root"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "role_KCC_TF"
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = (known after apply)
          + policy = (known after apply)
        }
    }

  # aws_iam_role_policy_attachment.policy-attach will be created
  + resource "aws_iam_role_policy_attachment" "policy-attach" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "role_KCC_TF"
    }

  # aws_iam_user.user will be created
  + resource "aws_iam_user" "user" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "user_KCC_TF"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user_group_membership.group_membership will be created
  + resource "aws_iam_user_group_membership" "group_membership" {
      + groups = [
          + "group_KCC_TF",
        ]
      + id     = (known after apply)
      + user   = "user_KCC_TF"
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + group_name = "group_KCC_TF"
  + role_arn   = (known after apply)
  + role_name  = "role_KCC_TF"
  + user_name  = "user_KCC_TF"
aws_iam_group.group: Creating...
aws_iam_role.role: Creating...
aws_iam_user.user: Creating...
aws_iam_group.group: Creation complete after 2s [id=group_KCC_TF]
aws_iam_user.user: Creation complete after 2s [id=user_KCC_TF]
aws_iam_user_group_membership.group_membership: Creating...
aws_iam_role.role: Creation complete after 3s [id=role_KCC_TF]
aws_iam_policy.policy: Creating...
aws_iam_user_group_membership.group_membership: Creation complete after 1s [id=terraform-20210913214811408200000001]
aws_iam_policy.policy: Creation complete after 1s [id=arn:aws:iam::<hide>:policy/policy_KCC_TF]
aws_iam_role_policy_attachment.policy-attach: Creating...
aws_iam_role_policy_attachment.policy-attach: Creation complete after 1s [id=role_KCC_TF-20210913214813860900000002]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

group_name = "group_KCC_TF"
role_arn = "arn:aws:iam::<hide>:role/role_KCC_TF"
role_name = "role_KCC_TF"
user_name = "user_KCC_TF"
dmgardella@abacaxi:~/KCC/TF (main=)$
```
