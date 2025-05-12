# 🍪 Cookie PoC with Sinatra + HTTPie

This is a simple Proof of Concept (PoC) to help you understand how HTTP **cookies** work using a lightweight **Ruby Sinatra** server and the CLI tool **HTTPie**.

---

## 🔧 Setup

### 1. Install dependencies

```bash
gem install sinatra
````

### 2. Run the server

#### ▶️ In development (default)

```bash
ruby server.rb
```

#### ▶️ In production (with environment variables)

**Fish shell:**

```fish
set -x APP_ENV production
set -x ALLOWED_HOSTS erickdjm.xyz,www.erickdjm.xyz
ruby server.rb
```

**Or using `env` inline:**

```bash
env APP_ENV=production ALLOWED_HOSTS=erickdjm.xyz ruby server.rb
```

#### ▶️ In deployment (e.g., Coolify)

Add the following environment variables in the dashboard:

```env
APP_ENV=production
ALLOWED_HOSTS=erickdjm.xyz,www.erickdjm.xyz
```

> The app will be available at `http://localhost:4567` or your production domain.

---

## 🧁 Endpoints

### ➤ `GET /set`

Sets a cookie named `username` with the value `"Erick"`.

* Server response header:

  ```
  Set-Cookie: username=Erick; path=/; max-age=2592000
  ```

### ➤ `GET /get`

Reads the `username` cookie from the incoming request and responds with:

* If cookie is present:

  ```
  Hello again, Erick!
  ```

* If cookie is missing:

  ```
  No cookie found!
  ```

### ➤ `GET /set2` and `GET /get2`

These routes handle an additional cookie named `cuk2`.

---

## 🧪 Testing with HTTPie

Install HTTPie if needed:

```bash
pip install httpie
```

### 1. Set the cookie

```bash
http -v GET http://localhost:4567/set
```

### 2. Manually send the cookie

```bash
http GET http://localhost:4567/get Cookie:"username=Erick"
```

### 3. Automatically handle cookies using sessions

```bash
http --session=cookies GET http://localhost:4567/set
http --session=cookies GET http://localhost:4567/get
```

---

## 🧠 What You'll Learn

| Concept              | Example                                      |
| -------------------- | -------------------------------------------- |
| Setting cookies      | via `response.set_cookie` in Sinatra         |
| Reading cookies      | via `request.cookies`                        |
| Manual client send   | using HTTP headers like `Cookie: name=value` |
| Automatic send/store | using HTTPie session files                   |
| Environment config   | dynamic setup via `ENV['APP_ENV']`           |
| Host protection      | via `set :host_authorization` in Sinatra     |

---

## 🚀 Extend This PoC

* Set multiple cookies (e.g., `theme`, `language`)
* Use `HttpOnly`, `Secure`, `Expires` options
* Simulate login/session handling
* Add a logout route to delete cookies
* Dockerize the app and deploy it behind a CDN (e.g., Cloudflare)

---

## 🧼 Clean Up

To remove session files created by HTTPie:

```bash
rm -r ~/.config/httpie/sessions/*
```

---

Happy cookie hacking 🍪✨
