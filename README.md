# simple-login-captcha

A small PHP/MySQL user registration and login application built to
practise a few common web security techniques:

1. Google reCAPTCHA v2 integration (on registration and password change)
2. Session checking and timeout handling
3. SQL-injection mitigation (escaped input, parameterised-style queries)
4. Basic directory-traversal mitigation
5. Real-time client-side password complexity validation

Front end is plain HTML/CSS/JavaScript; the back end is PHP with a MySQLi
database connection. This is functionally the same project as the sibling
`captcha` repo in this account, but ships with an actual SQL schema dump.

This is a coursework/learning project, not production software.

## What it does

- **Register** (`register.php` / `register_handle.php`): new users provide
  a name, email and password, must solve a Google reCAPTCHA v2 challenge,
  and get real-time feedback on password complexity (length, upper/lower
  case, digit, special character) via the bundled
  `js/jquery.passwordRequirements.js` plugin. Passwords are stored salted
  and hashed with SHA3-512 (random salt per user).
- **Login** (`index.php` / `login_handle.php`): users log in with
  email + password (no captcha on this page — reCAPTCHA is only used on
  register and password-change). On success the app records the client's
  IP address and login time in the session, and forces a password change
  if the stored password is more than 30 days old.
- **Home** (`home.php`): a landing page for logged-in users listing their
  last 10 login/logout records (time and IP), read from the `login` table,
  plus links to change password or log out.
- **Change password** (`password.php` / `password_handle.php`): requires
  the current password, re-salts and re-hashes the new one, protected by
  reCAPTCHA and the same real-time complexity check as registration.
- **Logout** (`logout.php`): writes a row to the `login` table (email,
  login time, IP) and destroys the session.

## Database

`cs_project.sql` in this repo is a phpMyAdmin dump of the `cs_project`
database, containing:

- `users` — `id`, `full_name`, `email`, `password` (SHA3-512 hex hash),
  `salt`, `timestamp` (date of last password change).
- `login` — `id`, `email`, `login_time`, `logout_time`, `ip`.

`dbconn.php` connects to this database as `root` with no password on
`localhost`.

## Running it

1. Install PHP and MySQL/MariaDB locally (e.g. XAMPP/WAMP/MAMP, or PHP's
   built-in server plus a MySQL server).
2. Import `cs_project.sql` into a `cs_project` database (e.g. via
   phpMyAdmin or `mysql -u root cs_project < cs_project.sql`).
3. Update `dbconn.php` if your MySQL credentials differ from the defaults.
4. If you want the reCAPTCHA to actually validate, replace the site key in
   `register.php`/`password.php` and the secret key in
   `register_handle.php` with your own keys from the Google reCAPTCHA
   admin console — the ones committed here are the original author's test
   keys and may not work.
5. Serve the folder with PHP's built-in server, e.g. `php -S localhost:8000`
   from this directory, and open `http://localhost:8000/index.php`.
