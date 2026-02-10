$base=$args[0]
$dns=$args[1]


for ($i=1; $i -le 254; $i++) {

$IP = $base + "." + $i

Resolve-DnsName -DnsOnly $IP -Server $dns -ErrorAction Ignore

}
