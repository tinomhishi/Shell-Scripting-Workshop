# If-else example
if [ -f "file.txt" ]; then
    echo "file.txt exists."
else
    echo "file.txt does not exist."
fi # marks the end of an if statement block

# For loop example
for i in {1..5}; do
    echo "Iteration $i"
done

# While loop example
COUNT=0
while [ $COUNT -lt 5 ]; do
    echo "Count: $COUNT"
    COUNT=$((COUNT + 1))
done