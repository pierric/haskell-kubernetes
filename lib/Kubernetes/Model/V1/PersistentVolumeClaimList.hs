-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a BSD license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.PersistentVolumeClaimList
    ( PersistentVolumeClaimList (..)
    , kind
    , apiVersion
    , metadata
    , items
    ) where

import           Control.Lens.TH (makeLenses)
import           Data.Aeson.TH (deriveJSON, defaultOptions, fieldLabelModifier)
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Prelude hiding (drop, error, max, min)
import qualified Prelude as P
import           Test.QuickCheck (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()
import           Kubernetes.Model.Unversioned.ListMeta (ListMeta)
import           Kubernetes.Model.V1.PersistentVolumeClaim (PersistentVolumeClaim)

-- | PersistentVolumeClaimList is a list of PersistentVolumeClaim items.
data PersistentVolumeClaimList = PersistentVolumeClaimList
    { _kind :: Maybe Text
    , _apiVersion :: Maybe Text
    , _metadata :: Maybe ListMeta
    , _items :: [PersistentVolumeClaim]
    } deriving (Show, Eq, Generic)

makeLenses ''PersistentVolumeClaimList

$(deriveJSON defaultOptions{fieldLabelModifier = P.drop 1} ''PersistentVolumeClaimList)

instance Arbitrary PersistentVolumeClaimList where
    arbitrary = PersistentVolumeClaimList <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary