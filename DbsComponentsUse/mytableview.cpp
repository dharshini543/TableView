#include "mytableview.h"
#include <QDebug>

MyTableView::MyTableView(QObject *parent)
    : QAbstractTableModel{parent}
{
    qDebug() <<Q_FUNC_INFO;
    m_rows.append({"Harsha", 24, "Chikkadinni" });
    m_rows.append({"Santhosh", 31, "Ayanoor" });
    m_rows.append({"Unknwon", 0, "Some Where Else" });

    m_previousIndex = -1;
    
    // Initialize column order (initially in order 0, 1, 2, 3, 4)
    m_columnOrder = {0, 1, 2, 3, 4};
    
    // Initialize column widths: 75, 905, 400, 75, 75
    m_columnWidths = {75, 905, 400, 75, 75};

    FileModelExample *f = new FileModelExample(this);
    f->setFilePath("Parameter");
    f->setFileDir("3");

    FileModelExample *f1 = new FileModelExample(this);
    f1->setFilePath("Global Aggregat");
    f1->setFileDir("9");

    FileModelExample *f2 = new FileModelExample(this);
    f2->setFilePath("Segewagen");
    f2->setFileDir("1");

    FileModelExample *f3 = new FileModelExample(this);
    f3->setFilePath("Pseudo");
    f3->setFileDir("98");

    FileModelExample *f4 = new FileModelExample(this);
    f4->setFilePath("Breitenanschlag");
    f4->setFileDir("4");

    FileModelExample *f5 = new FileModelExample(this);
    f5->setFilePath("Ausrichter");
    f5->setFileDir("4");

    m_fileModelList.append(f);
    m_fileModelList.append(f1);
    m_fileModelList.append(f2);
    m_fileModelList.append(f3);
    m_fileModelList.append(f4);
    m_fileModelList.append(f5);

    m_headers << "Column1" <<"Aggregat"<< "TakStation"<< "Column4" << "Column5";
}

int MyTableView::rowCount(const QModelIndex &parent) const
{
    qDebug() <<Q_FUNC_INFO << m_fileModelList.size();
    Q_UNUSED(parent)
    // return m_rows.size();
    return m_fileModelList.size();
}

int MyTableView::columnCount(const QModelIndex &parent) const
{
    qDebug() <<Q_FUNC_INFO << m_headers.size();
    Q_UNUSED(parent)
    return m_headers.size();
}

QVariant MyTableView::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    FileModelExample *f = m_fileModelList.at(index.row());
    int dataCol = m_columnOrder[index.column()];  // Get actual data column

    if (role == Qt::DisplayRole) {
        switch (dataCol) {
        case 1: return f->filePath();   // Aggregat
        case 2: return f->fileDir();    // TakStation
        default:
            return QVariant();          // IMPORTANT
        }
    }

    switch (role)  {
    case SelectedRole:
        return f->selected();
    case FileDirRole:
    case FilePathRole:
        // Return the correct data based on which data column is being displayed
        // regardless of which role is asked for
        if (dataCol == 1) {
            return f->filePath();
        } else if (dataCol == 2) {
            return f->fileDir();
        }
        return QVariant();
    default:
        return QVariant();
    }
}

QVariant MyTableView::headerData(int section, Qt::Orientation orientation, int role) const
{
    qDebug() <<Q_FUNC_INFO << "section:" << section << "orientation:" << orientation << "role:" << role;
    qDebug() << "Headers available:" << m_headers;

    if (role == Qt::DisplayRole && orientation == Qt::Horizontal && section >= 0 && section < m_headers.size()) {
        int dataCol = m_columnOrder[section];  // Get actual data column
        QVariant result = m_headers.at(dataCol);
        qDebug() << "Returning header data for section" << section << "(dataCol:" << dataCol << "):" << result;
        return result;
    }

    qDebug() << "Header data not found for section:" << section << "- headers size:" << m_headers.size();
    return QVariant();
}

QHash<int, QByteArray> MyTableView::roleNames() const
{
    qDebug() <<Q_FUNC_INFO;

    QHash<int, QByteArray> roles;
    roles[displayRole] = "display";
    roles[TableDataRole] = "tableData";
    roles[SelectedRole] = "selected";
    roles[FileDirRole] = "fileIsDir";
    roles[FilePathRole] = "fileName";

    qDebug() << "Role names:" << roles;
    return roles;
}

void MyTableView::setHeaders(const QStringList &headers)
{
    beginResetModel();
    m_headers = headers;
    m_rows.clear();
    endResetModel();
}

void MyTableView::addRow(const QVariantList &row)
{
    if (row.size() != m_headers.size())
    {
        qDebug() << "Row size doesn't match header size";
        return;
    }

    beginInsertRows(QModelIndex(), m_rows.size(), m_rows.size());
    m_rows.append(row);
    endInsertRows();
}

void MyTableView::clear()
{
    beginResetModel();
    m_rows.clear();
    m_headers.clear();
    endResetModel();
}

void MyTableView::setSelected(int row, bool selected)
{
    qDebug() <<Q_FUNC_INFO << row << " " << selected;

    if (row < 0 || row >= m_fileModelList.size())
        return;

    if(m_previousIndex == row)
        return;

    if (m_previousIndex != -1 && m_previousIndex != row)
    {
        FileModelExample *previousObj = m_fileModelList[m_previousIndex];
        if (previousObj)
        {
            previousObj->setSelected(false);

            QModelIndex start = index(m_previousIndex, 0);
            QModelIndex end   = index(m_previousIndex, columnCount() - 1);
            emit dataChanged(start, end, { SelectedRole });
        }
    }

    FileModelExample *selectedObj = m_fileModelList[row];
    if (selectedObj)
    {
        selectedObj->setSelected(selected);

        QModelIndex start = index(row, 0);
        QModelIndex end   = index(row, columnCount() - 1);
        emit dataChanged(start, end, { SelectedRole });
    }

    m_previousIndex = row;
}

QString FileModelExample::fileDir() const
{
    return m_fileDir;
}

void FileModelExample::setFileDir(const QString &newFileDir)
{
    if (m_fileDir == newFileDir)
        return;
    m_fileDir = newFileDir;
    emit fileDirChanged();
}

QString FileModelExample::filePath() const
{
    return m_filePath;
}

void FileModelExample::setFilePath(const QString &newFilePath)
{
    if (m_filePath == newFilePath)
        return;
    m_filePath = newFilePath;
    emit filePathChanged();
}

bool FileModelExample::selected() const
{
    return m_selected;
}

void FileModelExample::setSelected(const bool &newSelected)
{
    if (m_selected == newSelected)
        return;
    m_selected = newSelected;
    emit selectedChanged();
}

void MyTableView::swapColumns(int col1, int col2)
{
    qDebug() << Q_FUNC_INFO << "Swapping columns" << col1 << "and" << col2;
    
    // Validate indices
    if (col1 < 0 || col2 < 0 || col1 >= m_columnOrder.size() || col2 >= m_columnOrder.size()) {
        qWarning() << "Invalid column indices:" << col1 << col2;
        return;
    }
    
    if (col1 == col2) {
        return;  // Nothing to swap
    }
    
    beginResetModel();
    
    // Swap the column order mapping - this maps display column to data column
    std::swap(m_columnOrder[col1], m_columnOrder[col2]);
    
    // Swap the column widths
    std::swap(m_columnWidths[col1], m_columnWidths[col2]);
    
    endResetModel();
    
    qDebug() << "Column order after swap:" << m_columnOrder;
    qDebug() << "Column widths after swap:" << m_columnWidths;
    
    emit columnsSwapped(col1, col2);
}

int MyTableView::getColumnWidth(int column)
{
    if (column < 0 || column >= m_columnWidths.size()) {
        return 80;  // Default width
    }
    return m_columnWidths[column];
}

QString MyTableView::getColumnContent(int row, int column)
{
    if (row < 0 || row >= m_fileModelList.size()) {
        return "";
    }
    
    if (column < 0 || column >= m_columnOrder.size()) {
        return "";
    }
    
    FileModelExample *f = m_fileModelList.at(row);
    int dataCol = m_columnOrder[column];  // Get actual data column
    
    switch (dataCol) {
    case 1: return f->filePath();   // Aggregat
    case 2: return f->fileDir();    // TakStation
    default:
        return "";
    }
}
