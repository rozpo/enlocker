## 0.3.6

- Create decrypt command.
- Base encrypt/decrypt commands on the same class.
- Unified method to get key from user for crypt commands.
- Create common method to print output for crypt commands.
- Prepare and move existing implementation to common args validator for crypt commands.
- Catch error in case of failure for encrypt/decrypt operation.
- Add lock/unlock aliases for encrypt/decrypt commands.

## 0.2.4

- Create encrypt command.
- Use not parsed argument as source for encrypt command.
- Prompt user for key to be used in encrypt command.
- Validate key provided by user to be 32 length
- Formatting the output from encrypt command.

## 0.1.3

- Create update command.
- Print usage in case of UsageException.
- Add upgrade alias to update command.
- Check if root path is correct before run update.

## 0.0.1

- Initial version.
