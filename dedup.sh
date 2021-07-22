# Dedup

ids=(
1080
540
540
)

# https://stackoverflow.com/questions/13648410/how-can-i-get-unique-values-from-an-array-in-bash/17758600
printf '%s\n' "${ids[@]}" | sort -u