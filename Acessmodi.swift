// Here i'll be demonstrating all Swift access modifiers using a simple Library system

// open: Most accessible - allows inheritance and override outside the module
open class Book {
    // public: Accessible from any module, but can't be overridden
    public var title: String

    // internal: Default access level - accessible within the same module
    internal var pageCount: Int

    // fileprivate: Accessible only within the current source file
    fileprivate var isbn: String

    // private: Most restrictive - accessible only within this class
    private var secretNotes: String

    public init(title: String, pageCount: Int, isbn: String) {
        self.title = title
        self.pageCount = pageCount
        self.isbn = isbn
        self.secretNotes = "Internal library notes"
    }

    // Open method can be overridden by subclasses even in different modules
    open func displayBookInfo() {
        print("Title: \(title)")
    }

    // Public method accessible everywhere but can't be overridden outside module
    public func getPageCount() -> Int {
        return pageCount
    }

    // Internal method only accessible within the same module
    internal func updatePageCount(_ count: Int) {
        pageCount = count
    }

    // Fileprivate method only accessible within this source file
    fileprivate func getISBN() -> String {
        return isbn
    }

    // Private method only accessible within this class
    private func getSecretNotes() -> String {
        return secretNotes
    }
}

// Example of a class in the same module
class LibraryManager {
    let book = Book(title: "Swift Programming", pageCount: 400, isbn: "123-456-789")

    func manageBook() {
        // Can access: public, internal, and fileprivate members
        print(book.title)           // ✅ public
        print(book.pageCount)       // ✅ internal
        print(book.getISBN())       // ✅ fileprivate
        // book.secretNotes         // ❌ private - not accessible
        // book.getSecretNotes()    // ❌ private - not accessible
    }
}

let book = Book(title: "Twilight",pageCount: 224,isbn:"123456789")
book.displayBookInfo() // Title: Book
print(book.getPageCount()) // 0
book.updatePageCount(100) // 100
print(book.getISBN())
// book.getSecretNotes()


// // Example of inheritance within the same module
// class AudioBook: Book {
//     var duration: Double

//     init(title: String, pageCount: Int, isbn: String, duration: Double) {
//         self.duration = duration
//         super.init(title: title, pageCount: pageCount, isbn: isbn)
//     }

//     // Can override open methods
//     override open func displayBookInfo() {
//         super.displayBookInfo()
//         print("Duration: \(duration) hours")
//     }
// }