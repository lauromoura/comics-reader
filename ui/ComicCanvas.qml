import Qt 4.7

ListView {
    id: comic

    clip: true
    flickableDirection: Flickable.HorizontalFlick
    orientation: ListView.Horizontal
    
    model: RSS2Model {}
    delegate: ComicDelegate {}
}
