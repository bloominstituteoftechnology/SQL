class Note:

    def __init__(self, id, title, content, author):
        self.id = id
        self.title = title
        self.content = content
        self.author = author

    def __repr__(self):
        return "Note('{}', {}', '{}', '{}')".format(self.id, self.title, self.content, self.author)