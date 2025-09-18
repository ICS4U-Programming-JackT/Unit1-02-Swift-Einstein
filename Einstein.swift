import Foundation

let SpeedOfLight:Double = 2.998 * pow(10, 8)

// Error case for the input conversion failing
enum DataError: Error {
    case invalidInput
}

// Function to calculate the energy released
func main() {
    // User input
    print("Please enter the mass of your object (in kg):")
    
    // Get input
    if let mass = readLine() {
        
        // Try catch, throw errors if input is incorrect
        do {
            //Convert mass to double
            guard let massDouble = Double(mass) else {
                throw DataError.invalidInput
            }
            // Check if mass double is above zero
            if massDouble > 0 {
                    let energy = massDouble * pow(SpeedOfLight, 2)
                    let energyFormatted = String(format: "%.3e", energy)
                    print("The energy released by your object "
                    + "is \(energyFormatted) J (Joules)")
            } else {
                // Warn that input was not a positive number
                print("Error: Mass must be a positive number.")
            }


        } catch DataError.invalidInput {
            // Catches the error thrown
            print("Error: Please enter a valid number.")
        } catch {
            print("An unexpected error occurred: \(error)")
        }
    } else {
        // Warn that input could not be read
        print("Error: Could not read input.")
    }
}

main()