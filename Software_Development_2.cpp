#include <iostream> // for cin and cout
#include <iomanip> // for setw() and setprecision()
#include <string> // for length(), substr() and find()
#include <regex> // for searching and matching regular expression in string
#include <ctime> // for ctime()
#include <cctype> // for toupper() and isdigit()

using namespace std;

// Function to check if  name is valid
bool isValidName(string name)
{
    for (char c : name) // Loops through every character in the name
    {
        if (!isalpha(c) && c != ' ') // If the character is not a letter or space, return false
        {
            return false;
        } 
    }
    return true; // If all characters are valid, return true
}

// Function to check if an address is valid
bool isValidAddress(string address)
{
    for (char c : address) // Loops through every character in the address
    {
        if (!isalpha(c) && c != ' ') // If the character is not a letter or space, return false
        {
            return false;
        }
    }
    return true; // If all characters are valid, return true
}

// Function to check if a postcode is valid
bool isValidPostcode(string postcode)
{
    regex pattern("^[a-zA-Z][a-zA-Z0-9]{4,6}$"); // Regular expression pattern for valid postcodes
    return regex_match(postcode, pattern); // If postcode matches the pattern then returns true otherwise returns fals
}

// Function to check if an expiry date is valid
bool isValidExpiryDate(string date)
{
    if (date.length() != 8) { // If the date does not have 8 characters, return false
        return false;
    }
    for (int i = 0; i < 8; i++) { // Loop through every character in the date
        if (i == 2 || i == 5) { // If the character is the third or sixth character (where the slashes should be)
            if (date[i] != '/') { // If the character is not a slash, return false
                return false;
            }
        }
        else { // If the character is not a slash
            if (!isdigit(date[i])) { // If the character is not a digit, return false
                return false;
            }
        }
    }
    return true; // If all characters are valid, return true
}

// Function to check if an expiry date is not yet expired
bool checkExpiryDate(const string date) 
{
    time_t t = time(NULL);  // get current time in seconds since epoch
    tm current_time;        // struct to hold current time in local timezone
    localtime_s(&current_time, &t);  // fill struct with current time in local timezone

    int current_year = current_time.tm_year % 100; // get last two digits of current year
    int current_month = current_time.tm_mon + 1;   // get current month (zero-indexed, so add 1)
    int current_day = current_time.tm_mday;        // get current day of month

    int expiry_year = stoi(date.substr(6, 2));     // extract last two digits of year from date string
    int expiry_month = stoi(date.substr(3, 2));    // extract month from date string
    int expiry_day = stoi(date.substr(0, 2));      // extract day of month from date string

    // check if expiry date is earlier than current date
    if (expiry_year < current_year ||
        (expiry_year == current_year && expiry_month < current_month) ||
        (expiry_year == current_year && expiry_month == current_month && expiry_day < current_day)) 
    {
        return false;   // if expiry date is earlier than current date, return false
    }

    return true;    // otherwise, return true
}

int main()
{
    string name, address, postcode, cardNumber, cardnum, expiryDate, securityCode;
    int beansQty, popcornQty, milkQty, breadQty;
    const double beansPrice = 1.20;
    const double popcornPrice = 0.80;
    const double milkPrice = 1.15;
    const double breadPrice = 2.34;
    double subtotal, total, vat;

    // Prompt the user to input their name
    cout << "Please enter your name: ";

    // Read the user's name and store it in the name variable
    getline(cin, name);

    // Keep prompting the user to enter a valid name until a valid one is entered
    while (!isValidName(name)) 
    {
        cout << "Invalid name. \n Please enter a name with no symbols or numbers: ";
        getline(cin, name);
    }

    // Convert the name to all capital letters
    for (char& c : name) 
    {
        c = toupper(c);
    }

    // Prompt the user to input their address
    cout << "Please enter your address: ";
    getline(cin, address);

    // Keep prompting the user to enter a valid address until a valid one is entered
    while (!isValidName(address))
    {
        cout << "Invalid address.\n Please enter main address with only letters: ";
        getline(cin, address);
    }

    // Convert the address to all capital letters
    for (char& c : address) 
    {
        c = toupper(c);
    }

    // Prompt the user to input their postcode
    cout << "Please enter your postcode (no space): ";
    getline(cin, postcode);

    // Keep prompting the user to enter a valid postcode until a valid one is entered
    while (!isValidPostcode(postcode))
    {
        cout << "Invalid postcode.\n Please enter postcode (no space) again : ";
        getline(cin, postcode);
    }

    // Convert the postcode to all capital letters
    for (char& c : postcode) 
    {
        c = toupper(c);
    }

    // Prompt the user to input their card number
    cout << "Please enter your 16-digit payment card number(no spaces): ";
    getline(cin, cardNumber);

    // Keep prompting the user to enter a valid card number until a valid one is entered
    while (cardNumber.length() != 16)
    {
           cout << "Invalid number of digits.\n Please enter your 16-digit payment card number again(no spaces): "; 
           getline(cin, cardNumber);
    }

    // Replace all but the last four digits of the card number with asterisks
     cardnum = string(12, '*') + cardNumber.substr(cardNumber.length() - 4);

    // Prompt the user to input their card's expiry date
    cout << "Please enter your card's expiry date (DD/MM/YY): ";
    getline(cin, expiryDate);

    // Keep prompting the user to enter a valid expiry date until a valid one is entered
    while (!isValidExpiryDate(expiryDate))
    {
        cout << "Invalid date format. \nPlease enter correct date format (DD/MM/YY): ";
        getline(cin, expiryDate);
    }

    // Keep prompting the user to enter a valid expiry date that has not yet passed
    while (!checkExpiryDate(expiryDate))
    {
        cout << "Expired date. \nPlease enter correct date (DD/MM/YY): ";
        getline(cin, expiryDate);
    }

    // Prompt the user to input their card's security code
    cout << "Please enter your card's 3-digit security code: "; // prompt user for security code
    getline(cin, securityCode); // get input from user and store in securityCode variable

while (securityCode.length() != 3) // check if input length is not equal to 3
{
    cout << "Invalid number of digits.\n Please enter your 3-digit secret code again: "; // prompt user to enter 3-digit security code again
    getline(cin, securityCode); // get input from user again and store in securityCode variable
}


    cout << "Please enter the quantity of Popcorn you would like to purchase: ";
    cin >> popcornQty;

    cout << "Please enter the quantity of Evaporated Milk you would like to purchase: ";
    cin >> milkQty;


    cout << "Please enter the quantity of Bread you would like to purchase: ";
    cin >> breadQty;


subtotal = beansQty * beansPrice + popcornQty * popcornPrice + milkQty * milkPrice + breadQty * breadPrice;

// Calculate VAT (20% of subtotal)
vat = 0.2 * subtotal;

// Calculate total (subtotal + VAT)
total = subtotal + vat;

// Convert total to a string with two decimal places and a pound sign 
string totalStr = "\x9C" + to_string(total);
totalStr = totalStr.substr(0, totalStr.find('.') + 3); // Only keep two decimal places 

// Convert VAT to a string with two decimal places and a pound sign 
string vatStr = "\x9C" + to_string(vat);
vatStr = vatStr.substr(0, vatStr.find('.') + 3); // Only keep two decimal places



cout << "================================================================" << endl;
// Prints a line of equal signs to serve as a border for the receipt
cout << setw(35) << "SUPERMARKET RECEIPT" << endl;
// Prints the title of the receipt, centered with respect to the width of the console window
cout << "================================================================" << endl;
// Prints another line of equal signs to serve as a border for the receipt
cout << "NAME: " << name << endl;
// Prints the customer's name that was entered earlier in the program
cout << "ADDRESS: " << address << endl;
// Prints the customer's address that was entered earlier in the program
cout << "POSTCODE: " << postcode << endl;
// Prints the customer's postcode that was entered earlier in the program
cout << "CARD NUMBER: " << cardnum << endl;
// Prints the customer's card number that was entered earlier in the program
cout << "EXPIRY DATE: " << expiryDate << endl;
// Prints the customer's card expiry date that was entered earlier in the program
cout << "================================================================" << endl;
// Prints another line of equal signs to serve as a border for the receipt
cout << setw(15) << left << "ITEM" << setw(15) << left << "UNIT PRICE" << setw(11) << left << "QTY" << setw(10) << left << "PRICE" << endl;
// Prints the column headers for the receipt, specifying the width of each column and aligning them to the left
cout << "----------------------------------------------------------------" << endl;
// Prints a line of dashes to separate the column headers from the item details
cout << fixed << setprecision(2);
// Sets the floating-point output format to fixed with two decimal places
cout << setw(15) << left << "Baked Beans" << "\x9C" << setw(15) << beansPrice << setw(10) << left << beansQty << "\x9C" << setw(10) << left << beansQty * beansPrice << endl;
// Prints the details for the baked beans item, specifying the width of each column and aligning them to the left
cout << setw(15) << left << "Popcorn" << "\x9C" << setw(15) << popcornPrice << setw(10) << left << popcornQty << "\x9C" << setw(10) << left << popcornQty * popcornPrice << endl;
// Prints the details for the popcorn item, specifying the width of each column and aligning them to the left
cout << setw(15) << left << "Evap. Milk" << "\x9C" << setw(15) << milkPrice << setw(10) << left << milkQty << "\x9C" << setw(10) << left << milkQty * milkPrice << endl;
// Prints the details for the evaporated milk item, specifying the width of each column and aligning them to the left
cout << setw(15) << left << "Bread" << "\x9C" << setw(15) << breadPrice << setw(10) << left << breadQty << "\x9C" << setw(10) << left << breadQty * breadPrice << endl;
// Prints the details for the bread item, specifying the width of each column and aligning them to the left
cout << "----------------------------------------------------------------" << endl;
// Prints another line of dashes to separate the item details from the subtotal and VAT
// Display the subtotal with currency symbol
cout << setw(41) << left << "Subtotal" << "\x9C" << setw(10) << left << subtotal << endl;

// Display the VAT with currency symbol
cout << setw(41) << left << "VAT (20%)" << "\x9C" << setw(10) << left << vat << endl;

// Display a separating line
cout << "----------------------------------------------------------------" << endl;

// Display the total with currency symbol aligned to the right
cout << setw(41) << left << "TOTAL" << "\x9C" << right << total << endl;

// Display a line to separate the receipt from the ending message
cout << "=================================================================" << endl;

// Display the ending message
cout << "THANK YOU FOR SHOPPING WITH US! " << endl;

}
