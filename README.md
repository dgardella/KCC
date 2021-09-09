1. Dockerfile
2. K8s Statefulset
3. Jenkins pipeline
4. Bash script : Given a text file find to 10 word ocurrence:
```
dmgardella@abacaxi:~/KCC (main %=)$ cat test/data/moby_dick.txt | sed -e 's/[^[:alpha:]]/ /g' | tr '\n' " " |  tr -s " " |  tr " " '\n' |  tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head
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
6. Code
7. TF
