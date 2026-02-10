

prefix=$1
dns=$2

# echo "DNS resolution for $2"

for i in {1..254}
do
nslookup "${prefix}.${i}" "${dns}"
done
