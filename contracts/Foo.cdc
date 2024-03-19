import "Burner"

access(all) contract Foo {
    access(all) let storagePath: StoragePath

    access(all) var burnCount: UInt64

    access(all) resource R: Burner.Burnable {
        access(contract) fun burnCallback() {
            Foo.burnCount = Foo.burnCount + 1
        }
    }

    access(all) fun createR(): @R {
        return <- create R()
    }

    access(all) init() {
        self.burnCount = 0

        self.storagePath = /storage/foo
    }
}