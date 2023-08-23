# Enlocker

Enlocker is a command-line interface (CLI) application that provides encryption and decryption capabilities for your sensitive data. With Enlocker, you can easily encrypt your data to protect it from unauthorized access, and decrypt it when needed.

## Installation

To install Enlocker, follow these steps:

```
dart pub global activate --source git https://github.com/rozpo/enlocker
```

Then, verify installation by:

```
enlocker
```

The output should be something like this:

```
Encryption capabilities for your sensitive data.

Usage: enlocker <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  decrypt   Decrypt previously encrypted data.
  encrypt   Encrypt your sensitive data.
  update    Update to the latest version

Run "enlocker help <command>" for more information about a command.
```

## Usage

Enlocker provides two main commands: **encrypt** and **decrypt**. Commands can be used interchangeably with global options and flags:

### Encryption

To encrypt raw data invoke **encrypt** command:

```
enlocker encrypt "hello world"
```

```
Key: ********************************
Y4nvgE/h75UJX6xNoX+PtQ==
```

For encryption operation there is a **lock** alias avaliable.

```
enlocker lock "hello world"
```

### Decryption

To decrypt raw data invoke **decrypt** command:

```
enlocker decrypt "Y4nvgE/h75UJX6xNoX+PtQ=="
```

```
Key: ********************************
hello world
```

For decryption operation there is a **unlock** alias avaliable.

```
enlocker unlock "Y4nvgE/h75UJX6xNoX+PtQ=="
```

## Security Considerations

- **Keep your secret key safe**: The security of the encrypted data depends on the secrecy of the key. Make sure to choose a strong and secure key and keep it confidential.

- **Protect the encrypted data**: Store the encrypted data securely to prevent unauthorized access. Use appropriate file permissions and encryption at rest techniques to safeguard the encrypted files.

- **Verify data integrity**: Enlocker focuses on encryption and decryption, but it doesn't guarantee data integrity. It is recommended to use cryptographic hash functions or other integrity verification mechanisms for critical data.

## Contributions and Issue Reporting

Contributions to Enlocker are welcome! If you find any issues or have suggestions for improvements, please open an issue on the [Enlocker GitHub repository](https://github.com/rozpo/enlocker).

## License

Enlocker is open-source software released under the [MIT License](https://opensource.org/license/mit/). Please see the [LICENSE](LICENSE) file for more details.

## Acknowledgments

Enlocker makes use of various cryptographic libraries and algorithms. Special thanks to the authors and contributors of these libraries for their valuable work.

## Disclaimer

Enlocker should be used responsibly and in compliance with applicable laws and regulations. The developers are not responsible for any misuse or unlawful activities performed using this application.

Enlocker has not been reviewed by security professionals.