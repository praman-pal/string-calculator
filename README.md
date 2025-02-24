# String Calculator Rails App

## Overview
This is a simple Rails application that provides an API to perform addition on a string of numbers. It supports custom delimiters and handles negative numbers appropriately.

## Features
- Accepts a string of numbers separated by commas or custom delimiters.
- Handles new line delimiters.
- Prevents negative numbers and returns an error message.
- Displays the result after calculation.

## Installation

1. Clone the repository:
   ```sh
   git clone <repository-url>
   cd <repository-folder>
   ```
2. Install dependencies:
   ```sh
   bundle install
   ```
3. Start the Rails server:
   ```sh
   rails server
   ```
4. Open a browser and go to:
   ```
   http://localhost:3000/
   ```

## Endpoints

### 1. Home Page (Index)
- **URL:** `/`
- **Method:** `GET`
- **Description:** Loads the input form for entering numbers.

### 2. Add Numbers
- **URL:** `/add`
- **Method:** `POST`
- **Parameters:**
  - `numbers` (String) - A string of numbers separated by a delimiter.
- **Behavior:**
  - Returns the sum of the numbers.
  - Handles custom delimiters (e.g., `//;\n1;2`).
  - Returns an error message if negative numbers are provided.

### 3. Result Page
- **URL:** `/result`
- **Method:** `GET`
- **Parameters:**
  - `result` - The result of the addition operation.
- **Description:** Displays the calculated result.

## Example Requests

### Adding Numbers (Default Delimiter `,`)
#### Request:
```
POST /add
Body: numbers=1,2,3
```
#### Response:
Redirects to `result?result=6`

### Adding Numbers with Custom Delimiter
#### Request:
```
POST /add
Body: numbers=//;\n1;2;3
```
#### Response:
Redirects to `/result?result=6`

### Handling Negative Numbers
#### Request:
```
POST add
Body: numbers=1,-2,3,-4
```
#### Response:
Redirects to `/result?result=Negative numbers not allowed: [-2, -4]`

## Running Tests
To run the test cases, execute:
```sh
rails test
```

## License
This project is open-source and available under the MIT License.


