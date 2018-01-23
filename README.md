# KNCollectionFlowLayout
香奈儿主页效果。滑动展示

+ 布局比较复杂。所以使用了Masonry..
+ 自行写了一个FlowLayout 实现这个滑动模式。 

### 现展示一张效果图

![](https://github.com/krystalName/KNCollectionFlowLayout/blob/master/KNXiangnaier.gif)


+ 使用方法就当作普通的Item

```objc

// cell
- (KNCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = NSStringFromClass([KNCollectionViewCell class]);
    KNCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.tag = indexPath.row;
    [cell setIndex:(indexPath.row)];
    
    if(indexPath.row == 0){
        cell.imageView.image = nil;
    }else{
        if(indexPath.row == 1){
            [cell revisePositionAtFirstCell];
        }
        cell.titleLabel.text = @"你以为是什么？";
        cell.descLabel.text = @"爱情 | 亲情";
        cell.bottomLabel.text = @"还不是因为你懒？";
        if (indexPath.row % 2 == 0) {
            cell.imageView.image = [UIImage imageNamed:@"117"];
        }else if(indexPath.row % 3 == 0){
            cell.imageView.image = [UIImage imageNamed:@"115"];
        }else{
            cell.imageView.image = [UIImage imageNamed:@"116"];
        }
    }
    return cell;
}

```
