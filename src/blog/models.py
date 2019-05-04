
#Django Files
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

#Source files
from users.models import Profile
from pickmybruin import keys,settings

#Python Files
import boto3

class BlogPost(models.Model):
    """
    Model containing title, body, and images
    """
    title = models.CharField(max_length=250)
    author = models.CharField(max_length=60)
    user = models.ForeignKey(User, related_name='user', on_delete=models.CASCADE, null=True, blank=True)
    body = models.TextField()
    created = models.DateTimeField(auto_now_add=True,null=True,blank=True,editable=False)
    published = models.DateTimeField(auto_now_add=True,null=True,blank=True)
    updated = models.DateTimeField(auto_now=True,editable=False)
    publish = models.BooleanField(default=False)
    anonymous = models.BooleanField(default=False)

    class Meta:
        ordering = ('-publish',)

    def __str__(self):
        return self.title

class BlogPicture(models.Model):
    """
    Model container for image
    """
    filename = models.CharField(max_length=250)
    blog = models.ForeignKey(BlogPost, related_name='images')
    picture = models.ImageField(upload_to='blog_pictures/', null=True, blank=True, default='')

    class Meta:
        ordering = ('-filename',)

    def __str__(self):
        return self.filename

    #delete S3 reference
    def delete(self):
        pictureid = "media/" + str(self.picture)
        session = boto3.Session(
            aws_access_key_id=keys.AWS_ACCESS_KEY_ID,
            aws_secret_access_key=keys.AWS_SECRET_ACCESS_KEY,
            region_name="us-west-2",
        )

        s3 = session.resource("s3")
        s3.Object(settings.AWS_STORAGE_BUCKET_NAME, pictureid).delete()

class Comment(models.Model):
    """
    Model for comments
    """

    comment = models.ForeignKey('self', related_name='comments', on_delete=models.CASCADE, null=True, blank=True)
    user = models.ForeignKey(User, related_name='commentuser', on_delete=models.CASCADE, null=True, blank=True)
    author = models.CharField(max_length=60)
    blog = models.ForeignKey(BlogPost, related_name='commentblog', null=True, blank=True,on_delete=models.CASCADE)
    body = models.TextField()
    likes = models.ManyToManyField(User, blank=True)


    def __str__(self):
        return self.body

    @property
    def getLikes(self):
        return self.likes.count()

