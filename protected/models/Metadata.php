<?php

/**
 * This is the model class for table "metadata".
 *
 * The followings are the available columns in table 'metadata':
 * @property integer $id
 * @property integer $menu_id
 * @property integer $tipo_id
 * @property string $prop_name
 * @property string $prop_name_value
 * @property string $content
 *
 * The followings are the available model relations:
 * @property MetadataTipo $tipo
 * @property Menu $menu
 */
class Metadata extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'metadata';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('tipo_id, prop_name, prop_name_value, content', 'required'),
			array('menu_id, tipo_id', 'numerical', 'integerOnly'=>true),
			array('prop_name, prop_name_value', 'length', 'max'=>50),
			array('content', 'length', 'max'=>400),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, menu_id, tipo_id, prop_name, prop_name_value, content', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'tipo' => array(self::BELONGS_TO, 'MetadataTipo', 'tipo_id'),
			'menu' => array(self::BELONGS_TO, 'Menu', 'menu_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'menu_id' => 'Menu',
			'tipo_id' => 'Tipo',
			'prop_name' => 'Prop Name',
			'prop_name_value' => 'Prop Name Value',
			'content' => 'Content',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('menu_id',$this->menu_id);
		$criteria->compare('tipo_id',$this->tipo_id);
		$criteria->compare('prop_name',$this->prop_name,true);
		$criteria->compare('prop_name_value',$this->prop_name_value,true);
		$criteria->compare('content',$this->content,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Metadata the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
