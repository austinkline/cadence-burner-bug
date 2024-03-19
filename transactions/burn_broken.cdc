import "Foo"
import "Burner"

transaction {
    prepare(acct: auth(Storage) &Account) {
        let before = Foo.burnCount

        let r <- Foo.createR()
        acct.storage.save(<-r, to: Foo.storagePath)

        let v <- acct.storage.load<@AnyResource>(from: Foo.storagePath)
        Burner.burn(<-v)
        
        let after = Foo.burnCount
        assert(before + 1 == after, message: "burn callback was not run")
    }
}