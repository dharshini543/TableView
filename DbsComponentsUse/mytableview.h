#ifndef MYTABLEVIEW_H
#define MYTABLEVIEW_H

#include <QAbstractTableModel>
#include <QObject>
#include <QQmlEngine>
#include <QAbstractListModel>

class FileModelExample : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString fileDir READ fileDir WRITE setFileDir NOTIFY fileDirChanged FINAL)
    Q_PROPERTY(QString filePath READ filePath WRITE setFilePath NOTIFY filePathChanged FINAL)
    Q_PROPERTY(bool selected READ selected WRITE setSelected NOTIFY selectedChanged FINAL)
public:

    FileModelExample(QObject *parent = nullptr) : QObject{parent}{}
    QString fileDir() const;
    void setFileDir(const QString &newFileDir);

    QString filePath() const;
    void setFilePath(const QString &newFilePath);

    bool selected() const;
    void setSelected(const bool &newSelected);

signals:
    void fileDirChanged();
    void filePathChanged();
    void selectedChanged();

private:
    bool m_selected = false;
    QString m_filePath;
    QString m_fileDir;
};

class MyTableView : public QAbstractTableModel
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit MyTableView(QObject *parent = nullptr);

    enum TableRoles {
        displayRole = Qt::DisplayRole,
        TableDataRole,
        SelectedRole,
        FilePathRole,
        FileDirRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void setHeaders(const QStringList &headers);
    Q_INVOKABLE void addRow(const QVariantList &row);
    Q_INVOKABLE void clear();
    Q_INVOKABLE void setSelected(int row, bool selected);
    Q_INVOKABLE void swapColumns(int col1, int col2);
    Q_INVOKABLE int getColumnWidth(int column);
    Q_INVOKABLE QString getColumnContent(int row, int column);

signals:
    void columnsSwapped(int col1, int col2);
    
private:
    QStringList m_headers;
    QList<QVariantList> m_rows;
    QList<FileModelExample*> m_fileModelList;
    QVector<int> m_columnOrder;  // Maps display column index to data column index
    QVector<int> m_columnWidths;  // Widths for each column
    int m_previousIndex;
};

#endif // MYTABLEVIEW_H
