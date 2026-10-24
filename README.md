# Wedora Wedding Management

This version keeps the original Wedora frontend layout, logo, colors, featured cards, and existing featured photos. It adds role-based sign-in and registration, protected customer/vendor/admin API access, vendor listing submission, admin moderation, and 1,000 mixed sample vendor records with varied listing photos.

## Run on Windows
1. Install Node.js LTS.
2. Extract the ZIP.
3. Open the `Wedora_Final` folder.
4. Copy `.env.example` and name the copy `.env` (keep the dot at the beginning).
5. Open `.env` in Notepad and set your own `ADMIN_EMAIL` and a strong `ADMIN_PASSWORD`. Do not share this file.
6. Double-click `run-wedora.bat`. The first run installs packages and builds the website.
7. Keep the terminal window open and visit `http://localhost:5000/`.

## Test the roles
- **Customer:** Choose `Customer`, switch to Create account, enter a name, an email-shaped address such as `customer@example.com`, and a password of at least 6 characters. You do not need inbox access for local demo testing because email verification is not enabled.
- **Vendor:** Register the same way but choose `Vendor`. The vendor dashboard lets you add service listings linked to that account email. Listings remain unverified until an admin reviews them.
- **Admin:** Choose `Admin` on the login screen and use the exact values configured in `.env`. Admin accounts cannot be created from the public registration form.

## Important notes
- Admin credentials are read from `.env`; the `.env` file is excluded from version control. Change the example password before using the app beyond localhost.
- Sessions use random bearer tokens and expire after seven days. Logout invalidates the token.
- API permissions are enforced server-side: customers can see their own booking requests; vendors can manage only their own listings and related requests; admin-only endpoints handle listing moderation and platform summary.
- The catalogue includes demo/sample profiles. Do not represent sample names, ratings, prices, locations, or images as verified real businesses without checking them first. The original eight featured images are retained; added sample listings use varied image URLs.
- This is a student/demo application with a JSON-file database. For production deployment, use a managed database, HTTPS, rate limiting, CSRF/origin protections, audited admin setup, and a proper secrets manager.


## Customer booking workflow
1. Register or sign in as a Customer.
2. Open Find Vendors, choose a listing, and click View details.
3. Complete the booking request with event date, phone, guest count, budget, and requirements.
4. Open My Dashboard to track Pending, Accepted, Rejected, or Completed status.

## Vendor onboarding and order management
1. Register or sign in as a Vendor.
2. In the Vendor Dashboard, submit business name, service category, registration/licence number, business phone, location, starting price, years in business, capacity, portfolio URL, photo (PNG/JPEG/WebP up to 2 MB), and service description.
3. New listings remain unverified until an administrator reviews them. Registration/licence details are supplied by the vendor and are not independently validated by this demo.
4. In Customer requests, use Accept or Reject for pending requests. The customer sees the updated status in their dashboard.

## Important demo limitations
- This is a local demo using a JSON-file database. Back up `data/db.json`; do not run multiple server instances against the same file.
- Uploaded vendor images are stored as data URLs in the JSON database, so keep images under 2 MB. For a production deployment, use object storage and a database such as PostgreSQL.
- There is no payment gateway, email/SMS notification, calendar conflict lock, or independent business-registration verification yet. Booking requests are not confirmed until a vendor accepts them.
- Do not expose this demo publicly with real customer data without a security review, rate limiting, HTTPS, secure admin configuration, and privacy/terms pages.
