// Classes and objects

// convention says classes begin with capital letter
class Ghost {
    var isAlive = true;
    var strength = 9;
    
    // functions inside a class is a method
    func kill() {
        isAlive = false;
    }
    
    // return value is indicated with arrow
    func isStrong() -> Bool {
        return strength > 10;
    }
}

var ghost = Ghost();
print(ghost.isAlive)
ghost.strength = 20;
print(ghost)
ghost.kill();
print(ghost.isAlive)
print(ghost.isStrong())
