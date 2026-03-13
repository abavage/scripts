max_retries=3
count=0

while (( count < max_retries )); do
  if your_command; then
    echo "Command succeeded"
    break
  else
    echo "Command failed, retrying... ($((count + 1))/$max_retries)"
    ((count++))
    sleep 1
  fi
done

if (( count == max_retries )); then
  echo "Command failed after $max_retries attempts"
fi
