# Black Ops II: HUD Utils
A collection of personal HUD utilities designed with efficiency, reliability, and flexibility in mind. These utilities introduce several improvements, including reduced variable usage, leak-free element management, and a client archive system that lets you draw from both the archived and non-archived element pools when additional elements are needed.

# Features
1. Reduced Variable Usage
2. Leak-Free Management
3. Client Archive

# Recommendations
Stick to the archive pool whenever possible. The non-archived pool is not recommended for general use, as its availability and behavior are less predictable. Try to keep your HUD elements within the bounds of the archive pool to ensure consistent and reliable results.

# Example
```c
self.test = createtext( "Hello World!", "big", 1.0, "top_center", 0, 0, ( 1.0, 1.0, 1.0 ), 0, 1.0 );
```
