# Extrait

**Extrait** is a tool for identifying duplicate files by calculating and comparing their hash values. It efficiently processes files in a directory to detect duplicates, leveraging Elixir's concurrency features for scalable and performant file handling.

## Features

- **File Hashing**: Computes MD5 hashes for files to identify duplicates.
- **Concurrent Processing**: Utilizes Elixir's `GenServer` and `DynamicSupervisor` for concurrent file processing.
- **Flexible File Handling**: Processes files in chunks to handle large files efficiently.
- **Result Gathering**: Collects and reports duplicate file results.

## Installation

To install and use `Extrait`, follow these steps:

1. **Clone the Repository**

 ```bash
 git clone https://github.com/yourusername/extrait.git
 cd extrait
 ```
   
2. **Install Dependencies**

 ```bash
 mix deps.get
 ```

3. **Add path to /lib/extrait/application.ex file**

```bash
{Extrait.PathFinder, "add yout path inside these quotes"},
```

4. **Compile the Project**

```bash
mix compile
```

5. **Run the Application**

```bash
mix run --no-halt
```
