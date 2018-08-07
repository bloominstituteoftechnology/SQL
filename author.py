class Author:

    def __init__(self, id, first_name, last_name):
        self.id = id
        self.first_name = first_name
        self.last_name = last_name

    def __repr__(self):
        return "Note('{}', '{}', '{}')".format(self.id, self.first_name, self.last_name)