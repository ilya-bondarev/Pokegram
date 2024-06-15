# Pokegram

Pokegram is an API and desktop application designed to provide a platform for interacting with Pokémon-themed content.

## Tech Stack

- **Backend**: Flask
- **Database**: SQLAlchemy & PostgreSQL
- **Encryption**: bcrypt for password hashing
- **Desktop Application**: C# & Avalonia

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/ilya-bondarev/Pokegram.git
   cd Pokegram
   ```

2. Create a virtual environment and activate it:
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Set up the database:
  - Restore the PostgreSQL database from the dump file:
   ```bash
   psql -U your_username -d your_database -f pokegram_dump.sql
   ```
  - Change the config.py file

5. Run the application:
   ```bash
   python3 main.py
   ```

## Usage

- **API**: Access the web application at `http://127.0.0.1:5000`.
- **Desktop App**: Run the executable file in /Pokegram/Desktop-app/Pokemon/bin/Debug/net7.0/ or check the releases for the latest version.

## Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a new Pull Request

## Contacts

If you have any questions, please contact us through the following channels:
- **Telegram:** [@bondarev_i](https://t.me/bondarev_i)
- **Email:** [bondarev.ilya.dev@gmail.com](mailto:bondarev.ilya.dev@gmail.com)
- **LinkedIn:** [Bondarev Ilya](https://www.linkedin.com/in/bondarev-i/)
