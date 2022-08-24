mkdir input
cd INU
for i in *; do
  afl-tmin -i "$i" -o "../input/$i" -- "$@"
done
